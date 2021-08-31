// const Util = require("./utils.js");
const Asteroid = require("./asteroid");
const Ship = require("./ship");


function Game() {
  this.DIM_X = 500;
  this.DIM_Y = 500;
  this.NUM_ASTEROIDS = 6;
  this.asteroids = this.addAsteroids(6);
  this.ship = new Ship({pos: this.randomPosition(), color: "red"}, this);
}


Game.prototype.allObjects = function allObjects() {
    let all = this.asteroids.concat([this.ship]);
    return all;
};


Game.prototype.addAsteroids = function addAsteroids(num) {
  let res = [];
  for (let i = 0; i < num; i++) {
    res.push(new Asteroid({ pos: this.randomPosition() }, this));
  };
  return res;
};

Game.prototype.randomPosition = function randomPosition() {
  return [
    this.DIM_X * Math.random(),
    this.DIM_Y * Math.random()
  ];
};

Game.prototype.draw = function draw(ctx) {
  ctx.clearRect(0,0, this.DIM_X, this.DIM_Y);
  let all = this.allObjects();
  for (let i=0; i < all.length; i++) {
     all[i].draw(ctx);
    }
};

Game.prototype.moveObjects = function moveObjects() {
    let all = this.allObjects();
    for (let i=0; i < all.length; i++) {
      all[i].move();
    }
};

Game.prototype.wrap = function wrap(pos) {
    let pos1 = pos[0];
    let pos2 = pos[1];
    if (pos1 > this.DIM_X) {pos1 = pos1 - this.DIM_X} else if (pos1 < 0) {pos1 = pos1 + this.DIM_X};
    if (pos2 > this.DIM_Y) {pos2 = pos2 - this.DIM_Y} else if (pos2 < 0) {pos2 = pos2 + this.DIM_Y};
    return [pos1,pos2];
};

Game.prototype.checkCollisions = function checkCollisions() {
  for (let i1 = 0; i1 < this.asteroids.length; i1++) {
    for (let i2 = i1 + 1; i2 < this.asteroids.length; i2++) {
      if (this.asteroids[i1].isCollidedWith(this.asteroids[i2])) {
        this.asteroids[i1].collideWith(this.asteroids[i2]);
      }
    }
  }
};

Game.prototype.step = function step() {
  this.moveObjects();
  this.checkCollisions();
};

Game.prototype.remove = function remove(asteroid) {
  let astI = this.asteroids.indexOf(asteroid);
  this.asteroids.splice(astI, 1);
};

module.exports = Game;