import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/Root'

import { fetchAllPokemon } from './util/api_util';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions';
import { selectAllPokemon } from './reducers/selectors';

// import { fetchAllPokemon } from './middleware/thunk'

document.addEventListener('DOMContentLoaded', () => {

    // window.receiveAllPokemon = receiveAllPokemon;
    // window.fetchAllPokemon = fetchAllPokemon;
    // window.requestAllPokemon = requestAllPokemon;
    // window.selectAllPokemon = selectAllPokemon;
    // const getSuccess = pokemon => console.log(receiveAllPokemon(pokemon));
    // fetchAllPokemon().then(getSuccess);

    const store = configureStore();
    // window.store = store;
    
    // window.getState = store.getState;
    // window.dispatch = store.dispatch;
    

    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, rootEl);
});