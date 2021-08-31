const View = require("./ttt-view.js") // require appropriate file
const Game = require("../ttt_node/game.js") // require appropriate file

document.addEventListener("DOMContentLoaded", () => {
  // Your code here
  let el = document.querySelector(".ttt");

  let testGame = new Game();
  let testView = new View(testGame, el);

});
