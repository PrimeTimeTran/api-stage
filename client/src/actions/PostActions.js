import axios from 'axios';

import { API_ROOT } from '../constants/API-CONFIG.js';

import {
  POST_INITIAL,
  POST_REMOVE,
  POST_ADD
} from './types'

export const removePost = (postId) => {
  axios.delete(`${API_ROOT}/posts/${postId}`)
  return (dispatch) => {
    dispatch({ type: POST_REMOVE, payload: postId })
  }
}

export const initialPosts = () => {
  return (dispatch) => {
    axios.get(`${API_ROOT}/posts.json`)
      .then(response => {
        console.log('Response: ', response)
        dispatch({ type: POST_INITIAL, payload: response.data })
      })
  }
}

export const addPost = (post) => {
    return(dispatch) => {
    axios({
      method: 'post',
      url: `${API_ROOT}/posts`,
      data: {
        post
      }
    }).then(response => {
        dispatch({ type: POST_ADD, payload: response.data })
    })
  }
}
