#!/usr/bin/env node
const inquirer = require("inquirer");
const path = require("path");
const fse = require("fs-extra");
const { promises } = require("fs");

const { readdir } = promises;

const configFiles = {};
const configFolderPath = path.resolve(__dirname, "templates");

const run = async () => {
  const folders = await readdir(configFolderPath).catch(console.log);
  const currentDir = process.cwd();

  for (let folder of folders) {
    configFiles[folder] = path.join(configFolderPath, folder);
  }

  const { template } = await inquirer.prompt([
    {
      type: "list",
      message: "Pick the template you want to use:",
      name: "template",
      choices: Object.keys(configFiles),
    },
  ]);

  let templateFiles = await readdir(configFiles[template]).catch(console.log);

  templateFiles.filter((name) => name !== "node_modules");
  fse.copy(configFiles[template], currentDir, function (err) {
    if (err) {
      console.error(err);
    } else {
      console.log("success!");
    }
  });
};

run();
