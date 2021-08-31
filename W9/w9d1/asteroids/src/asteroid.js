const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");
const Ship = require("./ship.js")

const DEFAULTS = {radius:15, color:"blue"}

function Asteroid(options, game) {
    options.vel = options.vel || Util.randomVector(Math.random() * 1 + 1);
    options.radius = options.radius || DEFAULTS.radius;
    options.color = options.color || DEFAULTS.color;
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
    this.game = game;
}

Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.explode = function() {
    console.log(`${this.name} explodes!`);
}

Asteroid.prototype.collideWith = function(otherObject) {
    if (otherObject instanceof Ship) {
        otherObject.relocate();
        console.log(otherObject);
    }
};

module.exports = Asteroid;
