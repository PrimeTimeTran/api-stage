import React, { Component } from 'react';
import { Row, Col } from 'react-bootstrap';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { initialPosts, removePost, signIn, signOut } from '../actions';

import { PostsContainer } from '../containers';
import NavbarContainer from '../containers/NavbarContainer';
import NewPostForm from '../components/NewPostForm';
import SignUpForm from '../components/SignUpForm';

class Home extends Component {
  constructor(props) {
    super(props)
    // this.props.signIn({ email: 'datloiboi@gmail.com', password: 'asdfas' })
  }

  componentDidMount() {
    this.props.initialPosts();
  }

  removePost(postId) {
    this.props.removePost(postId);
  }

  render() {
    const { authenticated, posts, signIn, signOut } = this.props

    return ( authenticated
    ? (
      <div style={{ backgroundColor: '#e9ebee' }}>
        <NavbarContainer
          signIn={signIn}
          signOut={signOut}
          authenticated={authenticated}
        />
        <Row className="show-grid">
          <Col xsHidden md={2} mdOffset={1} style={{ backgroundColor: 'pink' }}>
            Sidebar
          </Col>
          <Col xs={12} md={6}>
            <NewPostForm />
            <PostsContainer posts={posts} onRemovePost={this.removePost.bind(this)}/>
          </Col>
          <Col xsHidden md={2} style={{ backgroundColor: '#7caeff' }}>
            Ads
          </Col>
        </Row>
      </div>
      )
    : <SignUpForm>Please Sign Up</SignUpForm>)
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({
    removePost, initialPosts, signIn, signOut }, dispatch)
}

const mapReduxStateToProps = ({ posts, authenticated }) => {
  return { posts, authenticated };
};

export default connect(mapReduxStateToProps, mapDispatchToProps)(Home);
