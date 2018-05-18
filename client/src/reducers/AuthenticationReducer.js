import {
  AUTHENTICATED,
  AUTHENTICATION_ERROR,
  AUTHENTICATION_REMOVE,
  UNAUTHENTICATED,
} from '../actions/types';

let INITIAL_STATE = false

export default function( state = INITIAL_STATE, action) {
  switch(action.type) {
    case AUTHENTICATED:
      return !state

    case AUTHENTICATION_ERROR:
      return state

    case AUTHENTICATION_REMOVE:
      return !state

    case UNAUTHENTICATED:
      return state

    default:
      return state;
  }
}