#!/usr/bin/env node

const { Level } = require("level");
const path = require("path");
const fs = require("fs");

if (process.argv.length < 3) {
  process.exit(1);
}

const PACK_FILE = process.argv[2];

let pack;
try {
  pack = JSON.parse(fs.readFileSync(PACK_FILE, "utf-8"));
} catch (err) {
  console.error("Error:", err);
  process.exit(1);
}

(async () => {
  for (const [extId, jsonFile] of Object.entries(pack)) {
    const dbPath = path.join(
      process.env.HOME,
      `.config/google-chrome/Default/Local Extension Settings/${extId}`
    );

    if (!fs.existsSync(jsonFile)) {
      console.error(`Error: JSON file not found: ${jsonFile}`);
      continue;
    }

    if (!fs.existsSync(dbPath)) {
      console.error(`Error: No LevelDB found for this extension: ${extId}`);
      continue;
    }

    let config;
    try {
      config = JSON.parse(fs.readFileSync(jsonFile, "utf-8"));
    } catch (err) {
      console.error("Error:", err);
      continue;
    }

    const db = new Level(dbPath, { valueEncoding: "json" });

    try {
      if (config.data && Array.isArray(config.data)) {
        await db.put("data", config.data);
      }

      for (const [key, value] of Object.entries(config)) {
        if (key !== "data") {
          await db.put(key, value);
        }
      }
    } catch (err) {
      console.error("Error:", err);
    } finally {
      await db.close();
    }
  }
})();
