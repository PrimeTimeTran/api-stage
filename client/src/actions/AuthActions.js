import axios from 'axios';

import {
  AUTHENTICATE,
  AUTHENTICATED
} from './types';

import { API_ROOT } from '../constants/ApiConfig';

export const signIn = ({ email, password }) => {
  let token = localStorage.getItem('auth_token');

  return async (dispatch) => {
    if (token) {
      return dispatch({ type: AUTHENTICATED })
    } else {
      const res = await axios.post(`${API_ROOT}/auth/login.json`, { email, password });
      localStorage.setItem('auth_token', res.data.token);
      dispatch({ type: AUTHENTICATE, payload: res.data });
    }
  }
}