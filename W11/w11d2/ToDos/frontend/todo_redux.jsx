import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import {receiveTodos, receiveTodo, removeTodo} from "./actions/todo_actions"; 

const Root = () => {
    return (
        <div>
            <h1>ToDos Apps</h1>
        </div>
        
    );
}

document.addEventListener("DOMContentLoaded", ()=>{
    const store = configureStore();
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo; 
    window.removeTodo = removeTodo;
    window.store = store;
    const root = document.getElementById("content");
    ReactDOM.render(<Root />, root);
} )


