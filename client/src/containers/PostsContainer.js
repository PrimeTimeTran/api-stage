import React, { Component } from 'react';

import Post from '../components/post';

class PostsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { posts: [] };
  }

  render() {
    const { children, posts } = this.props;
    return (
      <div className="container-posts">
        { children }
        {posts.map(post => {
          return (<Post post={post} key={post.id} onRemovePost={this.props.onRemovePost} />)
        })}
      </div>
    )
  }
};

export { PostsContainer };