import axios from 'axios';

import {
  AUTHENTICATE,
  AUTHENTICATED,
  UNAUTHENTICATE
} from './types';

import { API_ROOT } from '../constants/ApiConfig';

export const signIn = ({ email, password }) => {
  console.log('Email', email)
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
  let token = localStorage.removeItem('auth_token');

  return (dispatch) => {
    dispatch({ type: UNAUTHENTICATE })
  }
}