import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import {
  Glyphicon,
  FormControl,
  FormGroup,
  Navbar,
} from "react-bootstrap";

import { signIn, signOut } from '../actions';

import NavigationRightContainer from '../components/NavigationRightContainer'

class NavbarContainer extends Component {

  render() {
    return (
      <Navbar collapseOnSelect fixedTop>
        <div className='container'>
          <Navbar.Header>
            <Navbar.Brand>
              <a href="/"><Glyphicon glyph="align-left" /></a>
            </Navbar.Brand>
            <Navbar.Toggle />
            <Navbar.Form pullLeft>
              <form>
                <FormGroup controlId="search">
                  <FormControl
                    type="text"
                    placeholder="Search..."
                    style={{ width: '25em' }}
                  />
                </FormGroup>
              </form>
            </Navbar.Form>
          </Navbar.Header>

          <Navbar.Collapse>
            <NavigationRightContainer {...this.props} />
          </Navbar.Collapse>

        </div>
      </Navbar>
    );
  }
};

function mapDispatchToProps(dispatch) {
  return bindActionCreators({
    signIn, signOut }, dispatch)
}

const mapReduxStateToProps = ({ authenticated }) => {
  return { authenticated };
};

export default connect(mapReduxStateToProps, mapDispatchToProps)(NavbarContainer);