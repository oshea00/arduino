Arduino Fun
==========================
Actually, I'd say this project really combined all the learning I've done the last 2 days about programming the Arduino Uno board, the hardware and 'C'-like (actually really Java-like) language used to program it.

There are many "sketch" examples, including a built-in implementation of "Firmata" - a library/protocol for communicating with small microcontrollers via serial protocols.  Running this on the Arduino allows me to use any language capable of using the serial port to query and set I/O lines on the Arduino board.

In this case I'm using "processing" (processing.org) a java-based language that shares almost exactly the same syntax with Arduino's programming language. Interestingly, I first ran across Processing in its form as Processing.js. It turns out Khan Academy chose this canvas graphics library for their computer science course (well John Resig), and so, as it seems all things are eventually connected in the technology world, I realized I already knew (mostly) how to code to Arduino because, guess what?, it's all Java in the end.

For communicating via Firmata protocol, node.js has modules for serial communication as well as a Firmata module. I'll shortly be using node.js as well.

Project Video
-----

This video shows the outcome of this little experiment in the all-Processing Arduino solution. The various processing programs and snippet I've checked-in show examples of the graphic commands and communication commands needed. The final project used almost every one of these smaller examples.
[Seeing-Eye Arduino](http://youtu.be/O2iBeqT9KgA)

Node.js Examples
-----
Just added readdata.js which connects to a serial port and reads data sent by the Arduino.
Also added the simple Arduino 'sketch' that sends the data.


Enjoy,
Mike
