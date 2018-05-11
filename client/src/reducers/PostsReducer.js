import {
  POST_INITIAL,
  POST_REMOVE,
  POST_ADD
} from '../actions/types';

const INITIAL_STATE = []

export default (state = INITIAL_STATE, action) => {
  switch (action.type) {
    case POST_INITIAL:
      return action.payload

    case POST_ADD:
      return [ action.payload, ...state ]

    case POST_REMOVE:
      let arr = []
      arr = arr.concat(state)

      arr = arr.map(function(el) {
        let giveBack = (el.id !== action.payload)
        if (giveBack) {
          return el
        }
        return undefined
      });
      arr = arr.filter(item => item !== undefined);

      return arr

    default:
      return state;
  }
};
