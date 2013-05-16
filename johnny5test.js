var five = require("johnny-five"),
    // or "./lib/johnny-five" when running from the source
    board = new five.Board();

board.on("ready", function() {

 sensor = new five.Sensor({
    pin: "A0",
    freq: 250
  });

  board.repl.inject({
    sensor: sensor
  });

  sensor.scale([ 0, 100 ]).on("read", function() {
    console.log( this.normalized, this.scaled );
  });


});

