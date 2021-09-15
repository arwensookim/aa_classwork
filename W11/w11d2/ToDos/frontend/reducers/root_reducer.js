import { combineReducers } from "redux";
import stepsReducer from "./steps_reducers";
import todoReducer from "./todos_reducer";

const rootReducer = combineReducers({
    todos: todoReducer,
    steps: stepsReducer
})


export default rootReducer;