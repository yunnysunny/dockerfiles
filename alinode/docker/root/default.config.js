'use strict';

const fs = require('fs');
const HOME = process.env.HOME;
const ALINODE_CONFIG = `${HOME}/alinode.config.json`;
const defaults = {
  "heartbeatInterval": 60,
  "reconnectDelay": 10,
  "reportInterval": 60,
  "packages": ['/app/package.json'],
  "error_log": []
};

var custom = {};

if (fs.existsSync(ALINODE_CONFIG)) {
  custom = require(ALINODE_CONFIG);
}

const config = Object.assign(defaults, custom);

config.appid = config.appid || process.env.APP_ID;
config.secret = config.secret || process.env.APP_SECRET;
config.logdir = config.logdir || process.env.NODE_LOG_DIR || '/data/alinode';

if (config.appid && config.secret) {
  const runningCfg = `${HOME}/agenthub.running.json`;
  fs.writeFileSync(runningCfg, JSON.stringify(config, null, 2));
}
//fs.writeFileSync('/test.log', 'base');