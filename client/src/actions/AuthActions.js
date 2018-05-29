import axios from 'axios';

import {
  AUTHENTICATE,
  AUTHENTICATED,
  UNAUTHENTICATE,
} from './types';

import { API_ROOT } from '../constants/ApiConfig';

export const signIn = ({ email, password }) => {
  let token = localStorage.getItem('auth_token');

  return async (dispatch) => {
    if (token) {
      return dispatch({ type: AUTHENTICATED })
    } else {
      const res = await axios.post(`${API_ROOT}auth/login`, { email, password });
      localStorage.setItem('auth_token', res.data.token);
      dispatch({ type: AUTHENTICATE, payload: res.data });
    }
  }
}

export const signOut = () => {
  localStorage.removeItem('auth_token');
  return (dispatch) => {
    dispatch({ type: UNAUTHENTICATE })
  }
}

export const signUp = ({ email, password, password_confirmation }) => {
  return async (dispatch) => {

    const res = await axios.post(`${API_ROOT}signup`, { user: { email, password, password_confirmation }});
    localStorage.setItem('auth_token', res.data.token);
    dispatch({ type: AUTHENTICATE, payload: res.data });
  }
}