import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from "../actions/pokemon_actions";

const pokemonReducer = (oldState={}, action) => {
    Object.freeze(oldState);
    const newState = Object.assign({}, oldState);
    switch (action.type) {
        case RECEIVE_ALL_POKEMON:
            return {...oldState, ...action.pokemon}
        case RECEIVE_POKEMON:
            newState[action.pokemon.id] = action.pokemon;
            return newState;
        default:
            return oldState;
    }
}

export default pokemonReducer;