import React, { Component } from 'react';
import { connect } from 'react-redux';
import {
  Glyphicon,
  Navbar,
  Nav,
  NavItem
} from "react-bootstrap";

import SignInForm from '../components/SignInForm'

class NavbarContainer extends Component {
  render() {
    return (
      <Navbar collapseOnSelect>

        <Navbar.Header>
          <Navbar.Brand>
            <a href="/">React & Rails</a>
          </Navbar.Brand>
          <Navbar.Toggle />
        </Navbar.Header>

        <Navbar.Collapse>
          <Nav>
            <NavItem eventKey={1} href="#">
              <Glyphicon glyph="star" style={{ marginRight: '5px'}}/>
                Home
            </NavItem>
            <NavItem eventKey={2} href="#">
              Profile
            </NavItem>
          </Nav>
          <SignInForm isSignedIn={this.props.authenticated}/>
        </Navbar.Collapse>

      </Navbar>
    );
  }
};

const mapReduxStateToProps = ({ authenticated }) => {
  return { authenticated };
};

export default connect(mapReduxStateToProps, null)(NavbarContainer);