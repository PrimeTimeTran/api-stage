import {
  AUTHENTICATE,
  AUTHENTICATED,
  UNAUTHENTICATE
} from '../actions/types';

let INITIAL_STATE = {
  user: {
    id: null,
    email: '',
    first_name: '',
    last_name: ''
  },
  token: null
}

export default function(state = INITIAL_STATE, action) {
  switch(action.type) {
    case AUTHENTICATED:
      return state
    case AUTHENTICATE:
      const { user, token } = action.payload
      return { ...state, user: user, token }
    case UNAUTHENTICATE:
      console.log('Unauthenticate');
      return { ...state, token: null }
    default:
      return state;
  }
}