import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from "../actions/session";

const _nullSession = {
    currentUser: null,
};

export default (oldState = _nullSession, action) => {
    Object.freeze(oldState);
    switch (action.type) {
        case RECEIVE_CURRENT_USER:
            return Object.assign({}, {currentUser: action.user});
        case LOGOUT_CURRENT_USER:
            return _nullSession;
        default:
            return oldState;
    }
};

