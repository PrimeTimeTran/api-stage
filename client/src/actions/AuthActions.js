import axios from 'axios';

import {
  AUTHENTICATED
} from './types';

import { API_ROOT } from '../constants/ApiConfig';

export const signIn = ({ email, password }) => {
  let token = localStorage.getItem('user_token');

  return async (dispatch) => {
    if (token) {
      // Two wrong ways to do it
      // return (dispatch) => {
      //   type: AUTHENTICATED
      // };

      // dispatch(() => ({ type: AUTHENTICATED }))

      // Correct way
      return dispatch({ type: AUTHENTICATED })
    } else {
      const res = await axios.post(`${API_ROOT}/auth/login.json`, { email, password });
      console.log('Response: ', res);
      localStorage.setItem('user_token', res.data.auth_token);
      return (dispatch) => {
        type: AUTHENTICATED
      };
    }
  }
}

// export function signUp(credentials){
//   return dispatch => {
//       axios.post(`${API_ROOT}/signup`, credentials)
//       .then(response => {
//         console.log(response.data);
//       })
//       .catch(err => {
//         console.error(err);
//       })
//   }
// }