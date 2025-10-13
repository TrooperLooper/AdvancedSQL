import express from "express";
import pg from "pg";
import dotenv from "dotenv";
import { z } from "zod";

dotenv.config();

const app = express();
const { Pool } = pg;

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: Number(process.env.DB_PORT) || 5432,
});

const PlayerScoreSchema = z.object({
  name: z
    .string()
    .min(1, { message: "Name needs to include at least 1 character" }),
  game: z
    .string()
    .min(1, { message: "Game needs to include at least 1 character" }),
  score: z.number().min(1, { message: "Score must be a positive number" }),
});

app.get("/", (req, res) => {
  res.send("Hello World!");
});

app.get("/players-scores", async (req, res) => {
  try {
    const query = `SELECT players.name AS player_name, games.title AS game_title, scores.score
                       FROM scores
                       JOIN players ON scores.player_id = players.id
                       JOIN games ON scores.game_id = games.id`;
    const result = await pool.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching player scores:", error);
    res.status(500).send("Internal Server Error");
  }
});

app.get("/top-players", async (req, res) => {
  try {
    const query = `SELECT
    players.name AS player_name,
    SUM(scores.score) AS total_score
FROM scores
JOIN players ON scores.player_id = players.id
GROUP BY players.name
ORDER BY total_score DESC
LIMIT 3`;

    const result = await pool.query(query);
    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching top players:", error);
    res.status(500).send("Internal Server Error");
  }
});

// Add this test route after your existing routes
app.get("/test-db", async (req, res) => {
  try {
    console.log("Testing database connection...");
    const result = await pool.query("SELECT 1 as test");
    console.log("Database connection successful!");
    res.json({ success: true, result: result.rows });
  } catch (error) {
    console.error("Database test failed:", error);
    res.status(500).json({ error: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
