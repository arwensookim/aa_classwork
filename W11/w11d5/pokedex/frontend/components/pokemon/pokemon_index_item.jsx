import React from "react";
import { Link } from "react-router-dom"

class PokemonIndexItem extends React.Component{
    constructor(props) {
        super(props)

    }

    render() {
        return(
            <Link to={`/pokemon/${this.props.poke.id}`} >
                <li>
                    <img width="100px" src={this.props.poke.imageUrl}/>
                    {this.props.poke.name}
                </li>
            </Link>
        
        )
    }
}

export default PokemonIndexItem;