import React, { Component } from 'react';
import axios from 'axios';
import {
  Button,
  Col,
  form,
  FormControl,
  FormGroup,
} from "react-bootstrap";

class SignUpForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      email: '',
      password: '',
      password_confirmation: '',
      width: 0,
      height: 0,
    };

    this.onSubmit = this.onSubmit.bind(this)
  }

  onSubmit(e) {
    e.preventDefault()
    axios({
      method: 'post',
      url: `http://localhost:3001/v1/signup`,
      data: {
        user: {
          email: this.state.email,
          password: this.state.password,
          password_confirmation: this.state.password_confirmation
        }
      }
    }).then(response => response)
        .then(data => {
          if (data.status === 201) {
              this.props.history.push("/");
              console.log('Successfully Login');
          }
        })
  }

  render() {
    if (this.props.isSignedIn) {
      return (
        <Button bsStyle="primary" className={"navbar-form navbar-right"} inline="true">Sign Out </Button>
      )
    }
    return (
      <form onSubmit={e => this.onSubmit(e)} componentclass="fieldset" className={"navbar-form navbar-right"} inline="true" >
        <FormGroup>
          <Col>
            <FormControl
              type="email"
              placeholder="Email"
              value={this.state.email}
              onChange={e => this.setState({ email: e.target.value })}
            />
          </Col>
        </FormGroup>

        <FormGroup controlId="formHorizontalPassword">
          <Col>
            <FormControl
              type="password"
              placeholder="Password"
              onChange={e => this.setState({ password: e.target.value })}
            />
          </Col>
        </FormGroup>

        <FormGroup controlId="formHorizontalPasswordConfirmation">
          <Col>
            <FormControl
              type="password"
              placeholder="Password Confirmation"
              onChange={e => this.setState({ password_confirmation: e.target.value })}
            />
          </Col>
        </FormGroup>

        <FormGroup>
          <Col sm={10}>
            <Button type="submit" bsStyle="primary" className={( this.state.width < 450 ? 'pull-right' : '')}>
              Sign in
            </Button>
          </Col>
        </FormGroup>
      </form>
    )
  }
};

export default SignUpForm;