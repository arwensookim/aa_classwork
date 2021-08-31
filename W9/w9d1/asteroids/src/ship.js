const Util = require("./utils")
const MovingObject = require("./moving_object")

Util.inherits(Ship, MovingObject);

function Ship(options, game) {
  this.pos = options.pos;
  this.radius = 10;
  this.vel = [0,0];
  this.color = "red";
  this.game = game;
};

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
  this.vel = [0,0];
};

module.exports = Ship;