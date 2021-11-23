const cluster = require('cluster');
const http = require('http');
const numCPUs = 2;//require('os').cpus().length;
const process = require('process');

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
    res.writeHead(200);
    res.end('hello world\n');
  }).listen(8000);
  server.timeout = TIMEOUT_SERVER;
  server.keepAliveTimeout = TIMEOUT_SERVER;

  console.log(`Worker ${process.pid} started`);
}