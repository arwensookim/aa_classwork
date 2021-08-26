// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = Array(8).fill().map(() => Array(8));
  grid[4][4] = new Piece('white')
  grid[3][3] = new Piece('white')
  grid[4][3] = new Piece('black')
  grid[3][4] = new Piece('black')
  return grid
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (x >= 0 && x < 8 && y >= 0 && y < 8){
    return true;
  };
  return false;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    throw new Error('Not valid pos!');
  };
  let x = pos[0];
  let y = pos[1];

  return this.grid[x][y];
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);

  if (!piece){
    return false;
  };

  return piece.color === color;
 
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return !!this.getPiece(pos);
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip=[]){
  
  let nextPos = [pos[0]+ dir[0], pos[1]+dir[1]];

  if (!this.isValidPos(nextPos)) {
    return [];
  } else if (!this.isOccupied(nextPos)) {
    return [];
  } else if (this.isMine(nextPos,color)) {
    return piecesToFlip;
  }


  piecesToFlip.push(nextPos);
  return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
  // return piecesToFlip;
  

};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  };

  if ( Board.DIRS.some (dir => this._positionsToFlip(pos, color, dir).length > 0) ){
    return true;
  };

  return false;


};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)){
    throw new Error('Invalid move!');
  }
  x = pos[0];
  y = pos[1];
  
  let allPosDir = [];
  
  Board.DIRS.forEach (dir => {
    allPosDir = allPosDir.concat(this._positionsToFlip(pos, color, dir));
      });

    allPosDir.forEach( position => this.getPiece(position).flip());
    this.grid[x][y] = new Piece(color)
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validMovesArr = [];
  for(let i = 0; i < this.grid.length; i++){
    for(let j = 0; j < this.grid.length; j++){
      let move = [i, j];
      if (this.validMove(move, color)){
        validMovesArr.push(move);
      }
    }
  }
  return validMovesArr;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length !== 0
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove("black") && !this.hasMove("white");
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE