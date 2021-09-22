import { Route } from "react-router-dom";
import React from "react";
import PokemonIndexContainer from "./pokemon/pokemon_index_container"
import { Switch } from "react-router";

const App = () => (
    <Switch>
        <Route path="/pokemon/:pokemonId" />
        <Route path="/" component={PokemonIndexContainer} />
    </Switch>
   
)

export default App;