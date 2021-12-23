const cluster = require('cluster');
const http = require('http');
const url = require('url');
const numCPUs = 2;//require('os').cpus().length;
const process = require('process');
function fibonacciCalc(n) {
  if (n === 0 | n === 1) {
    return 1;
  }
  return  fibonacciCalc(n-1) + fibonacciCalc(n-2);
}
function fibonacciCalc2(n) {
  if (n === 0 | n === 1) {
    return 1;
  }
  var temp = 0;
  var k1;
  var k2;
  k1=k2=1;
  for (var i = 2;i <= n;i++) {

    temp = k1+k2;
    k1 = k2;
    k2 = temp;
  }
  return temp;
}
function doFb(req,urlObj, res) {
  const n = Number(urlObj.query.n) || 0;
  res.end(String(fibonacciCalc(n)));
}
/**
 * 
 * @param {String} url 
 * @returns {
 * {
 * path:String,
 * query:String<String>
 * }
 * }
 */
function parseUrl(url) {
  const result = {path:'', query: {}};
  const path = url;
  const paramStart = path.indexOf('?');
  if (paramStart != -1) {
    const queryString = url.substring(paramStart + 1);
    result.path = url.substring(0, paramStart);
    const pairs = queryString.split('&');
    for (var i=0,len=pairs.length;i<len;i++) {
      const kv = pairs[i];
      const keyValueData = kv.split('=');
      if (keyValueData.length != 2) {
        continue;
      }
      result.query[keyValueData[0]] = keyValueData[1];
    }
  }
  return result;
}

if (cluster.isMaster) {
  console.log(`Primary ${process.pid} is running`);

  // Fork workers.
  for (let i = 0; i < numCPUs; i++) {
    cluster.fork();
  }

  cluster.on('exit', (worker, code, signal) => {
    console.log(`worker ${worker.process.pid} died`);
  });
} else {
  const TIMEOUT_SERVER = 1000 * 60 * 30;
  // Workers can share any TCP connection
  // In this case it is an HTTP server
  const server = http.createServer((req, res) => {
    const urlObj = parseUrl(req.url)
    const path = urlObj.path;
    if (path === '/fb') {
      return doFb(req, urlObj, res)
    }
    res.writeHead(200);
    res.end('hello world\n');
    console.log(`request from ${req.socket.localAddress} on path ${path}`)
  }).listen(process.env.APP_PORT || 8000);
  server.timeout = TIMEOUT_SERVER;
  server.keepAliveTimeout = TIMEOUT_SERVER;

  console.log(`Worker ${process.pid} started`);
}