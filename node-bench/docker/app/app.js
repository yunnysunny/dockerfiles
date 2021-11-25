const http = require('http');
//const url = require('url');
const process = require('process');


const ENV = process.env;

const INTERVAL = Number(ENV.REQ_INTERVAL_MS) || 1;
const URL = ENV.REQ_URL;
const POOL_SIZE = Number(ENV.HTTP_POOL_SIZE) || 0;
let agent = undefined;

if (POOL_SIZE > 0) {
	agent = new http.Agent({
		keepAlive: true,
		maxSockets: POOL_SIZE,
		keepAliveMsecs: 3000,
	});
}

if (!URL) {
	console.error('request url is empty');
	process.exit(127);
}
var ok = 0;
var failed = 0;
setInterval(function() {
	const req = http.request(URL, {agent}, function(res) {
		ok++;
	});
	req.on('error', function(err) {
		console.error(err)
		failed++;
	});
}, INTERVAL);

const STATISTIC_INTERVAL = 10 * 1000;
setInterval(function() {
	console.info('OK:' + ok + ',failed:' + failed + ' in ' + STATISTIC_INTERVAL + 'ms');
	ok = 0;
	failed = 0;
}, STATISTIC_INTERVAL);

