// curl -X POST http://localhost:3801/api/hello -H "Content-Type: application/json" -d '{"name":"Andrey"}'

import "source-map-support/register.js";
import express from "express";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const port = 8080;
const app = express();
app.use(express.json());

app.get("/", (_, res) => {
  const filePath = path.join(__dirname, "index.html");
  fs.readFile(filePath, "utf8", (err, data) => {
    if (err) {
      res.status(500).send("Error reading HTML file");
      return;
    }
    res.send(data);
  });
});

app.post("/api/hello", (req, res) => {
  const body = req.body;
  console.log(body, "------------------------------------BODY");
  try {
    const name = body.name;
    if (!name || typeof name !== "string")
      throw new Error("Name is missing or incorrect");
    res.json({ "system-response": `Hello, ${name}!` });
  } catch (error) {
    console.error(error);
    res.sendStatus(400);
  }
});

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
