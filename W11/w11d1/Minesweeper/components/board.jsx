import React from 'react';
import Tile from './tile';


class Board extends React.Component {
  constructor(props) {
    super(props);
    this.renderRows = this.renderRows.bind(this);
    this.renderTiles = this.renderTiles.bind(this);
  }

  render() {
    return (
      <div id="board">
        {this.renderRows()}
      </div>
    )
  };

    renderRows() {
      const board = this.props.board;
      board.grid.map((row, i)=> {
        return(<div className="row">
          {this.renderTiles(row, i)}
        </div>
        )
      });
    };

    renderTiles(row, i) {
      row.map((tile) => {
        return(<Tile tile={tile} updateGame={this.props.updateGame}/>);
      });
    };

};

export default Board;