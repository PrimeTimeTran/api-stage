import axios from 'axios';

import {
  AUTHENTICATED
} from './types';

import { API_ROOT } from '../constants/API-CONFIG.js';

export const signInAction = ({ email, password }) => {
  let token = localStorage.getItem('user_token');

  return async (dispatch) => {
    if (token) {
      localStorage.setItem('user_token', token);
      return (dispatch) => {
        type: AUTHENTICATED
      };
    } else {
      const res = await axios.post(`${API_ROOT}/auth/login.json`, { email, password });
      localStorage.setItem('user_token', res.data.auth_token);
      return (dispatch) => {
        type: AUTHENTICATED
      };
    }
  }
}