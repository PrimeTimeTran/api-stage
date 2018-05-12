import React, { Component } from 'react';
import { Grid, Row, Col } from 'react-bootstrap';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { initialPosts, removePost } from './actions/PostActions';

import './App.css';
import { NavbarContainer } from './containers'
import { Post } from './components';
import NewPostForm from './components/NewPostForm'

class App extends Component {
  constructor(props) {
    super(props)
    this.props.initialPosts();
  }
  removePost(postId) {
    this.props.removePost(postId);
  }

  render() {
    const { posts } = this.props
    return (
      <div style={{ backgroundColor: '#e9ebee' }}>
        <NavbarContainer />

        <Row className="show-grid">
          <Col xs={12} md={2} mdOffset={1} style={{ backgroundColor: 'pink' }}>
            Hello World
          </Col>
          <Col xs={12} md={6}>
            <NewPostForm />
            {posts.map(post => {
              return (<Post post={post} key={post.id} onRemoveList={this.removePost.bind(this)} />)
            })}
          </Col>
          <Col xs={12} md={2} style={{ backgroundColor: '#7caeff' }}>
            Hello World
          </Col>
        </Row>

      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({
    removePost, initialPosts }, dispatch)
}

const mapReduxStateToProps = ({ posts }) => {
  return { posts };
};

export default connect(mapReduxStateToProps, mapDispatchToProps)(App);
