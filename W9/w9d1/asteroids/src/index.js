console.log("webpack is working!");
const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");

window.Util = Util;
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;

document.addEventListener("DOMContentLoaded", function(){
    console.log('DOM fully loaded and parsed');
    const canvas = document.getElementById("mycanvas");
    canvas.width = 500;
    canvas.height = 500;
  
    const ctx = canvas.getContext("2d");
    const game = new Game();
    // console.log(game.asteroids);
    const gameView = new GameView(game, ctx);
    gameView.start();

});