import React, { Component } from 'react';
import { Row, Col } from 'react-bootstrap';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { initialPosts, removePost, signInAction } from '../actions';

import { PostsContainer } from '../containers';
import NavbarContainer from '../containers/NavbarContainer';
import NewPostForm from '../components/NewPostForm';
import SignUpForm from '../components/SignUpForm';

class HomePage extends Component {
  constructor(props) {
    super(props)
    this.props.initialPosts();
    this.props.signInAction({ email: 'datloiboi@gmail.com', password: 'asdfas' })
  }

  removePost(postId) {
    this.props.removePost(postId);
  }

  render() {
    const { authenticated, posts } = this.props

    if (!authenticated) {
      return (
        <div style={{ backgroundColor: '#e9ebee' }}>
          <NavbarContainer />
          <Row className="show-grid">
            <Col xsHidden md={2} mdOffset={1} style={{ backgroundColor: 'pink' }}>
              Sidebar
            </Col>
            <Col xs={12} md={6}>
              <NewPostForm />
              <PostsContainer posts={posts} onRemovePost={this.removePost.bind(this)}/>
            </Col>
            <Col xsHidden md={2} style={{ backgroundColor: '#7caeff' }}>
              Addbar
            </Col>
          </Row>
        </div>
      )
    } else {
      return <SignUpForm />
    }
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({
    removePost, initialPosts, signInAction }, dispatch)
}

const mapReduxStateToProps = ({ posts, authenticated }) => {
  return { posts, authenticated };
};

export default connect(mapReduxStateToProps, mapDispatchToProps)(HomePage);
