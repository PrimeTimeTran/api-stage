import React, { Component } from 'react';

import { Post } from '../components';

class PostsContainer extends Component {
  render() {
    const { children, posts } = this.props;
    return (
      <div>
        { children }
        {posts.map(post => {
          return (<Post post={post} key={post.id} onRemovePost={this.props.onRemovePost} />)
        })}
      </div>
    )
  }
};

export { PostsContainer };