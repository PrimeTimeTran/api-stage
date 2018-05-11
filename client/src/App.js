import React, { Component } from 'react';
import { Grid, Row, Col } from 'react-bootstrap';
import { createStore, applyMiddleware, bindActionCreators } from 'redux';
import { Provider, connect } from 'react-redux';
import ReduxThunk from 'redux-thunk';

import reducers from './reducers';
import { initialPosts, removePost } from './actions/PostActions';

import './App.css';
import NavbarContainer from './components/NavbarContainer'

class App extends Component {
  render() {
    return (
        <div>
          <NavbarContainer />

          <Grid>
            <Row className="show-grid">
              <Col xs={12} md={12} style={{ backgroundColor: 'yellow' }}>
                Welcome!
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
