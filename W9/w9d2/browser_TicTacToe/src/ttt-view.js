class View {
  constructor(game, el) {
    this.game = game;
    this.el = el;
    
    this.handleClick = this.handleClick.bind(this)
    this.setupBoard()
    this.bindEvents()
  }
  
  setupBoard() {
    let ul = document.createElement("ul");
    for(let i = 0; i < 3; i++) {
      for(let j = 0; j < 3; j++) {
        let li = document.createElement("li");
        li.dataset.pos = JSON.stringify([i, j]);
        
        ul.appendChild(li);
      }
    } 
    ul.classList.add("tttGrid")
    this.el.appendChild(ul)
  }
  
  bindEvents() {
    this.el.addEventListener("click", this.handleClick)
  }

  handleClick(e) {
    let space = e.target;
    "LI" === space.nodeName && this.makeMove(space)
    space.removeEventListener("click", this.handleClick)
  }

  makeMove(square) {
    const pos = JSON.parse(square.dataset.pos);
    const current = this.game.currentPlayer;
    try {
      this.game.playMove(pos);
    } catch (square) {
      alert("This " + square.msg.toLowerCase())
    }
    square.classList.add(current);
    square.innerText = current
    this.game.isOver() && this.handleGameOver()
  }

  handleGameOver() {
    this.el.removeEventListener("click", this.handleClick);
    this.el.classList.add("game-over");
    const winner = this.game.winner();
    const winMessage = document.createElement("h2");
    if (winner) {
      this.el.classList.add(`winner-${winner}`);
      winMessage.append(`You won, ${winner}!`) ;
    } else {
      winMessage.append("It's a draw!");
    }
    this.el.append(winMessage)
  }
}

module.exports = View;
