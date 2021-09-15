import { RECEIVE_STEPS, RECEIVE_STEP, REMOVE_STEP} from "../actions/step_actions";

// const initialState = {
    
    
//       1: {
//         id: 1,
//         title: 'walk to store',
//         done: false,
//         todo_id: 1
//       },
//       2: {
//         id: 2,
//         title: 'buy soap',
//         done: false,
//         todo_id: 1
//       }
    
//   }

const stepsReducer = (oldState = {}, action) => {
    Object.freeze(oldState);
    const newState = Object.assign({}, oldState);

    switch (action.type) {
        case RECEIVE_STEPS:
            const nextState = {}
            action.steps.forEach( step => {
                nextState[step.id] = step;
            });
            return nextState;
        case RECEIVE_STEP:
            newState[action.step.id] = action.step;
            return newState;
        case REMOVE_STEP:
            delete newState[action.step.id];
            return newState;
    
        default:
            return oldState;
    }
}

export default stepsReducer;