import React, { Component } from 'react';
import { connect } from 'react-redux';
import {
  Col,
  Row
} from 'react-bootstrap';

import PostsContainer from '../containers/PostsContainer';
import NavigationPanel from '../components/NavigationPanel';
import NavbarContainer from '../containers/NavbarContainer';

import SignUpForm from '../components/signup';
import NewPostForm from '../components/NewPostForm';

class Home extends Component {
  render() {
    const { authenticated } = this.props
    return (
      <div className="container-home">
        <NavbarContainer />
        <div style={styles.trick} />
          { (authenticated.token) ?
            <Row>

              <Col xsHidden md={2} style={styles.leftSideBar}>
                <NavigationPanel style={{ marginTop: '1em' }}/>
              </Col>

              <Col xs={12} md={7} style={styles.middleSideBar}>
                <NewPostForm authenticated={authenticated}  />
                <PostsContainer />
              </Col>

              <Col xsHidden md={1} style={styles.rightSideBar}>
                Ads
              </Col>

            </Row>
          : <Row>
              <Col xs={12} md={8} />
              <Col xs={12} md={4} style={{ marginTop: '5em', paddingRight: '5em'}}>
                <SignUpForm />
              </Col>
            </Row>
          }
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

const mapReduxStateToProps = ({ authenticated }) => {
  return { authenticated };
};

export default connect(mapReduxStateToProps)(Home);
