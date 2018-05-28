import React, { Component } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { initialPosts, removePost } from '../actions';

import Post from '../components/post';

import './index.css';

class PostsContainer extends Component {
  constructor(props) {
    super(props);
    this.state = { posts: [] };
    this.props.initialPosts();
  }

  componentWillReceiveProps(nextProps) {
    this.setState({ posts: nextProps.posts })
  }

  render() {
    const { posts } = this.state
    return (
      <div className="container-posts">
        {this.props.children}
        {posts.map(post => {
          return (<Post post={post} key={post.id} onRemovePost={this.props.onRemovePost} />)
        })}
      </div>
    )
  }
};

function mapDispatchToProps(dispatch) {
  return bindActionCreators({
    initialPosts, removePost }, dispatch)
}

const mapReduxStateToProps = ({ posts, authenticated }) => {
  return { posts, authenticated };
};

export default connect(mapReduxStateToProps, mapDispatchToProps)(PostsContainer);