import React, { Component } from 'react';
import { Row, Col } from 'react-bootstrap';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { initialPosts, removePost, signInAction } from './actions';

import './App.css';
import { NavbarContainer, PostsContainer } from './containers'
import NewPostForm from './components/NewPostForm'

class App extends Component {
  constructor(props) {
    super(props)
    this.props.initialPosts();
  }
  removePost(postId) {
    this.props.removePost(postId);
  }
  componentWillMount() {
    signInAction({ email: 'datloiboi@gmail.com', password: 'asdfas' } )()
  }

  // onSignIn() {
  //   signInAction({ email: 'datloiboi@gmail.com', password: 'asdfas' } )
  // }

  render() {
    const { posts } = this.props
    return (
      <div style={{ backgroundColor: '#e9ebee' }}>
        <NavbarContainer />

        <Row className="show-grid">
          <Col xsHidden md={2} mdOffset={1} style={{ backgroundColor: 'pink' }}>
            Hello World
          </Col>
          <Col xs={12} md={6}>
            <NewPostForm />
            <PostsContainer posts={posts} onRemovePost={this.removePost.bind(this)}/>
          </Col>
          <Col xsHidden md={2} style={{ backgroundColor: '#7caeff' }}>
            Hello World
          </Col>
        </Row>

      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({
    removePost, initialPosts, signInAction }, dispatch)
}

const mapReduxStateToProps = ({ posts }) => {
  return { posts };
};

export default connect(mapReduxStateToProps, mapDispatchToProps)(App);
