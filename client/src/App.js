import React, { Component } from 'react';
import { Grid, Row, Col } from 'react-bootstrap';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { initialPosts, removePost } from './actions/PostActions';

import './App.css';
import NavbarContainer from './components/NavbarContainer'
import Post from './components/Post';

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
      <div>
        <NavbarContainer />

        <Grid>
          <Row className="show-grid">
            <Col xs={12} md={12} style={{ backgroundColor: 'yellow' }}>
              {posts.map(post => {
                return (<Post post={post} key={post.id} onRemoveList={this.removePost.bind(this)} />)
              })}
            </Col>
          </Row>
        </Grid>
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
