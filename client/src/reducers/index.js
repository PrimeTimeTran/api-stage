import { combineReducers } from 'redux';
import PostsReducer from './PostsReducer';
import AuthenticationReducer from './AuthenticationReducer';

const rootReducer = combineReducers({
  posts: PostsReducer,
  authenticated: AuthenticationReducer
});


export default rootReducer;