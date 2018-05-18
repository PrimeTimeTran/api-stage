import React, { Component } from 'react';

import { Post } from '../components';

class PostsContainer extends Component {
  render() {
    const { posts } = this.props;
    return (
      <div>
        {posts.map(post => {
          return (<Post post={post} key={post.id} onRemovePost={this.props.onRemovePost} />)
        })}
      </div>
    )
  }
};

export { PostsContainer };