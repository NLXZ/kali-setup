#!/usr/bin/env node

const { Level } = require("level");
const path = require("path");
const fs = require("fs");

if (process.argv.length < 4) process.exit(1);

const JSON_FILE = process.argv[2];
const EXT_ID = process.argv[3];

const config = JSON.parse(fs.readFileSync(JSON_FILE, "utf-8"));

(async () => {
  const dbPath = path.join(
    process.env.HOME,
    `.config/google-chrome/Default/Local Extension Settings/${EXT_ID}`
  );

  const db = new Level(dbPath, { valueEncoding: "json" });

  if (config.data && Array.isArray(config.data)) {
    await db.put("data", config.data);
  }

  for (const [key, value] of Object.entries(config)) {
    if (key !== "data") {
      await db.put(key, value);
    }
  }

  await db.close();
})();
