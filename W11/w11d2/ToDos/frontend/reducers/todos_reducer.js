import { RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO } from "../actions/todo_actions";

// const initialState = {
//   1: {
//     id: 1,
//     title: "wash car",
//     body: "with soap",
//     done: false,
//   },
//   2: {
//     id: 2,
//     title: "wash dog",
//     body: "with shampoo",
//     done: true,
//   }
// };

const todoReducer = (oldState = {}, action) => {
  Object.freeze(oldState);
  const newState = Object.assign({},;
  switch (action.type) {
    case RECEIVE_TODOS:
      const nextState = {}
      action.todos.forEach( todo => {
        nextState[todo.id] = todo
      });
      return nextState;
  
    case RECEIVE_TODO:
      newState[action.todo.id] = action.todo
      return newState;

    case REMOVE_TODO:
      // newState = Object.assign({}, oldState);
      delete newState[action.todo.id];
      return newState;

    default:
      return oldState;
  }
}

export default todoReducer;