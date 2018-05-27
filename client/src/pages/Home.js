import React, { Component } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import {
  Col,
  Row
} from 'react-bootstrap';

import { initialPosts, addPost, removePost, signIn, signOut } from '../actions';

import { PostsContainer } from '../containers';
import NavigationPanel from '../components/NavigationPanel';
import NavbarContainer from '../containers/NavbarContainer';
import NewPostForm from '../components/NewPostForm';

import SignUpForm from '../components/signup';

class Home extends Component {
  constructor(props) {
    super(props)
    this.state = {
      email: '',
      password: '',
      formErrors: {email: '', password: ''},
      emailValid: false,
      passwordValid: false,
      formValid: false
    }
  }

  componentDidMount() {
    this.props.initialPosts();
  }

  removePost(postId) {
    this.props.removePost(postId);
  }

  render() {
    const { authenticated, addPost, posts, signIn, signOut } = this.props

    // return (
    //   <div className="container-home">

    //     <NavbarContainer
    //       signIn={signIn}
    //       signOut={signOut}
    //       authenticated={authenticated}
    //     />
    //     <div className='container'>
    //       <div style={styles.trickStyle} className='test'>
    //       { (authenticated.token) ?
    //           <Row>
    //             <Col xsHidden md={2}>
    //               <NavigationPanel style={{ marginTop: '1em' }}/>
    //             </Col>
    //             <Col xs={12} md={8}>
    //               <div className="pre-scrollable" style={{ maxHeight: '94vh' }}>
    //                 <PostsContainer posts={posts} onRemovePost={this.removePost.bind(this)}>
    //                   <NewPostForm />
    //                 </PostsContainer>
    //               </div>
    //             </Col>
    //             <Col xsHidden md={2} style={{ marginTop: '1em', backgroundColor: '#7caeff' }}>
    //               Ads
    //             </Col>
    //           </Row>
    //         : <Row>
    //             <Col xs={12} md={8} />
    //             <Col xs={12} md={4} style={{ marginTop: '1em' }}>
    //             <SignUpForm />
    //             </Col>
    //           </Row>
    //         }
    //       </div>

    //     </div>
    //   </div>
    // )

  return (
      <div className="container-home">
        <NavbarContainer
          signIn={signIn}
          signOut={signOut}
          authenticated={authenticated}
        />
        <div style={styles.trick} />
        { (authenticated.token) ?
          <Row>
            <Col xsHidden md={2} style={styles.leftSideBar}>
              <NavigationPanel style={{ marginTop: '1em' }}/>
            </Col>
            <Col xs={12} md={7} style={styles.middleSideBar}>
              <PostsContainer posts={posts} onRemovePost={this.removePost.bind(this)}>
                <NewPostForm addPost={addPost} authenticated={authenticated}/>
              </PostsContainer>
            </Col>
            <Col xsHidden md={1} style={styles.rightSideBar}>
              Ads
            </Col>
          </Row>
        : <Row>
            <Col xs={12} md={8} />
            <Col xs={12} md={4} style={{ marginTop: '1em' }}>
              <SignUpForm />
            </Col>
          </Row> }
      </div>
    )
  }
}

const styles = {
  navBar: {
    position: 'fixed',
    height: '40px',
    width: '100%',
    zIndex: 2
  },
  trick: {
    maxWidth: '1170px',
    margin: '0 auto',
  },
  leftSideBar: {
    position: 'fixed',
    top: '50px',
    left: 0,
  },
  middleSideBar: {
    margin: '0 300px',
    top: '50px'
  },
  rightSideBar: {
    position: 'absolute',
    top: '50px',
    right: 0,
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({
    addPost, removePost, initialPosts, signIn, signOut }, dispatch)
}

const mapReduxStateToProps = ({ posts, authenticated }) => {
  return { posts, authenticated };
};

export default connect(mapReduxStateToProps, mapDispatchToProps)(Home);
