var WebSocketServer = require('ws').Server
  , wss = new WebSocketServer({port: 8888});

var five = require('johnny-five'),
    // or "./lib/johnny-five" when running from the source
    board = new five.Board();

var fs = require('fs');
var http = require('http');

var msg = '';
var _ws = null;

board.on("ready", function() {

 sensor = new five.Sensor({
    pin: "A0",
    freq: 225
  });

//  board.repl.inject({
//    sensor: sensor
//  });

  sensor.scale([ 0, 100 ]).on("read", function() {
    console.log( this.normalized, this.scaled );
    try
    {
    if (_ws != null)
        _ws.send(''+this.scaled);
    }
    catch (err)
    {
    } 
  });

});

wss.on('connection', function(ws) {
    _ws = ws;
});

wss.on('disconnect', function(ws) {
    _ws = null;
});

var server = http.createServer(function(request, response) {
    console.log((new Date()) + ' Received request for ' + request.url);
    fs.readFile(__dirname+request.url,
    function (err, data) {
      if (err) {
          response.writeHead(500);
          return response.end('Error loading '+request.url);
      }
      response.writeHead(200);
      response.end(data);
    });
});

server.listen(8080, function() {
    console.log((new Date()) + ' Server is listening on port 8080');
});




