import axios from 'axios';

import { API_ROOT } from '../constants/API-CONFIG.js';

import {
  POST_INITIAL,
  POST_REMOVE,
  POST_ADD
} from './types'

export const removePost = (postId) => {
  console.log('Removing Post: ', postId)
  axios.delete(`${API_ROOT}/posts/${postId}`)
  return (dispatch) => {
    dispatch({ type: POST_REMOVE, payload: postId })
  }
}

export const initialPosts = () => {
  return (dispatch) => {
    axios.get(`${API_ROOT}/posts`)
      .then(response => {
        dispatch({ type: POST_INITIAL, payload: response.data })
      })
  }
}

export const addPost = (list) => {
    return(dispatch) => {
    axios({
      method: 'post',
      url: `${API_ROOT}/posts`,
      data: {
        list
      }
    }).then(response => {
        dispatch({ type: POST_ADD, payload: response.data })
    })
  }
}
