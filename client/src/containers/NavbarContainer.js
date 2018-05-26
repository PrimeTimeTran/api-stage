import React, { Component } from 'react';
import {
  Button,
  Glyphicon,
  FormControl,
  FormGroup,
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
            <SignInForm {...this.props} />
          </Navbar.Collapse>

        </div>
      </Navbar>
    );
  }
};

export default NavbarContainer;