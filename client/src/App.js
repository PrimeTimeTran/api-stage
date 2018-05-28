import React, { Component } from 'react';
import { connect } from 'react-redux';
import Routes from './routes';

class App extends Component {
  render () {
    return <Routes authenticated={this.props.authenticated} />
  }
}

const mapReduxStateToProps = ({ authenticated }) => {
  return { authenticated };
};

export default connect(mapReduxStateToProps)(App);
