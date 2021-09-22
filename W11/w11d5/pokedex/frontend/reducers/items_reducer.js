import { RECEIVE_POKEMON } from "../actions/pokemon_actions";

const itemsReducer = (oldState={}, action) => {
    Object.freeze(oldState);
    const newState = Object.assign({}, oldState);
    switch (action.type) {
        case RECEIVE_POKEMON:
            newState[action.pokemon.id] = action.pokemon.items;
        default:
            return oldState;
    }
}

export default itemsReducer;