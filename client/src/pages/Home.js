import React, { Component } from 'react';
import { Row, Col } from 'react-bootstrap';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { initialPosts, removePost, signIn, signOut } from '../actions';

import { PostsContainer } from '../containers';
import NavbarContainer from '../containers/NavbarContainer';
import NewPostForm from '../components/NewPostForm';

class Home extends Component {
  componentDidMount() {
    this.props.initialPosts();
  }

  componentWillUpdate() {
    console.log('Home Component Updating')
  }

  removePost(postId) {
    this.props.removePost(postId);
  }

  render() {
    const { authenticated, posts, signIn, signOut } = this.props

    return (
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
            {
              authenticated.token && (
                <div>
                  <NewPostForm />
                  <PostsContainer posts={posts} onRemovePost={this.removePost.bind(this)}/>
                </div>
              )
            }
          </Col>
          <Col xsHidden md={2} style={{ backgroundColor: '#7caeff' }}>
            Ads
          </Col>
        </Row>
      </div>
      )
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
