import React from 'react';


class Tile extends React.Component {
  constructor(props) {
    super(props)
    this.handleClick = this.handleClick.bind(this);
  };

  handleClick(event) {
    const tile = this.props.tile;
    const flagged = event.altKey ? true : false;
    this.props.updateGame(tile, flagged);
  };

  render(){
    const tile = this.props.tile;
    let text;
    let klass;
    if(tile.explored) {
      if(tile.bombed) {
        text = '\u2622';
        klass = 'bombed'
      } else {
        count = tile.adjacentBombCount();
        text = (count > 0 ? `${count}` : '');
        klass = 'explored';
      };

    } else if(tile.flagged) {
      klass = 'flagged';
      text = '\u2691';
    } else {
      klass = 'unexplored';
    };

    return(
      <div onclick={this.handleClick} className={klass} >{text}</div>
    )
  };
}

export default Tile;