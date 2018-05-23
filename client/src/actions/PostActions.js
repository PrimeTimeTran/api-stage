import { API_ROOT } from '../constants/ApiConfig';

import {
  POST_INITIAL,
  POST_REMOVE,
  POST_ADD
} from './types';

import client from './client';
const request = client();

export const addPost = (post) => {
  return(dispatch) => {
    request.post(`${API_ROOT}posts`, { post })
    .then(response => {
      dispatch({ type: POST_ADD, payload: response.data })
    })
  }
}

export const initialPosts = () => {
  return (dispatch) => {
    request.get(`${API_ROOT}posts`)
      .then(response => {
        console.log('Response: ', response)
        dispatch({ type: POST_INITIAL, payload: response.data })
      }).catch(err => {
        console.log('Error: ', err)
      })
  }
}

export const removePost = (postId) => {
  request.delete(`${API_ROOT}posts/${postId}`)
  return (dispatch) => {
    dispatch({ type: POST_REMOVE, payload: postId })
  }
}


