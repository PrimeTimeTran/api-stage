import React, { Component } from 'react';
import {
  Button,
  Col,
  Form,
  FormControl,
  FormGroup,
} from "react-bootstrap";

class SignInForm extends Component {
  constructor(props) {
    super(props);
    this.state = { width: 0, height: 0 };
    this.updateWindowDimensions = this.updateWindowDimensions.bind(this);
  }

  componentDidMount() {
    this.updateWindowDimensions();
    window.addEventListener('resize', this.updateWindowDimensions);
  }

  componentWillUnmount() {
    window.removeEventListener('resize', this.updateWindowDimensions);
  }

  updateWindowDimensions() {
    this.setState({ width: window.innerWidth, height: window.innerHeight });
  }

  render() {
    return (
      <Form componentClass="fieldset" className={"navbar-form navbar-right"} inline>
        <FormGroup>
          <Col>
            <FormControl type="email" placeholder="Email" />
          </Col>
        </FormGroup>

        <FormGroup controlId="formHorizontalPassword">
          <Col>
            <FormControl type="password" placeholder="Password" />
          </Col>
        </FormGroup>

        <FormGroup>
          <Col sm={10}>
            <Button type="submit" bsStyle="primary" className={( this.state.width < 450 ? 'pull-right' : '')}>
              Sign in
            </Button>
          </Col>
        </FormGroup>
      </Form>
    )
  }
};

export { SignInForm };