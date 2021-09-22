import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
    constructor(props) {
        super(props);
        
        // this.props = Object.values(this.props.pokemon);
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render() {
        if (!this.props.pokemon) return null;
        return(
            <div>
                <ul>
                    {this.props.pokemon.map((poke) => (
                        <PokemonIndexItem key={poke.id} poke={poke}/>
                    ))}
                </ul>
            </div>
        )
    }
}

export default PokemonIndex;
