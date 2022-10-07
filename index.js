var express = require('express');

const PORT = process.env.PORT || 8888;

var app = express();

app.get('/', function (req, res) {
  console.log(req);
  res.send('Bienvenido');
});

app.get('/:name', function (req, res) {
  console.log(req);
  res.send('Hola ' + req.params.name);
});

const server = app.listen(PORT);
console.log('Running on http://localhost:' + PORT);

process.on('SIGTERM', () => {
  console.log('SIGTERM signal received: closing HTTP server')
  server.close(() => {
    console.log('HTTP server closed')
  })
})