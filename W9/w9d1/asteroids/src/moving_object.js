// base class for anything that moves
const Util = require("./utils");

function MovingObject(options, game) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
    this.game = game;
}

MovingObject.prototype.move = function() {
    this.pos = Util.addVectors(this.pos, this.vel);
    this.pos = this.game.wrap(this.pos);
}

MovingObject.prototype.draw = function(ctx) {
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI, true);
    // ctx.strokeStyle = "green";
    // ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle = this.color;
    ctx.fill();
}

MovingObject.prototype.isCollidedWith = function(otherMovingObject) {
    let dist = Util.getDistance(otherMovingObject.pos, this.pos);
    let bool = dist <= (this.radius + otherMovingObject.radius);
    // console.log(bool);
    // console.log(dist);
    return bool;
}

MovingObject.prototype.collideWith = function(otherMovingObject) {
    // this.game.remove(otherMovingObject);
    // this.game.remove(this);
    
};

module.exports = MovingObject;