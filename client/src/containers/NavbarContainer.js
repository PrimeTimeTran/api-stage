import React, { Component } from 'react';
import {
  Glyphicon,
  Navbar,
  Nav,
  NavItem
} from "react-bootstrap";

import SignInForm from '../components/SignInForm'

class NavbarContainer extends Component {
  componentWillMount() {
  }
  render() {
    return (
      <Navbar collapseOnSelect>
        <div className='container'>
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
            <SignInForm {...this.props} />
          </Navbar.Collapse>
        </div>
      </Navbar>
    );
  }
};

export default NavbarContainer;