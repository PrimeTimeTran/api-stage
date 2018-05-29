import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';
import {
  Button,
  ControlLabel,
  Panel,
  FormControl,
  FormGroup,
  HelpBlock
} from 'react-bootstrap';

import { FormErrors } from '../FormErrors';
import { signUp } from '../../actions'

class SignUpForm extends Component {
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

  handleUserInput (e) {
    const name = e.target.name;
    const value = e.target.value;
    this.setState({[name]: value},
                  () => { this.validateField(name, value) });
  }

  handleChange(e) {
    this.setState({ value: e.target.value })
  }

  getValidationState() {
    const length = this.state.email.length;
    if (length > 10) return 'success';
    else if (length > 5) return 'warning';
    else if (length > 0) return 'error';
    return null;
  }

  errorClass(error) {
    return(error.length === 0 ? '' : 'has-error');
  }

  validateField(fieldName, value) {
    let fieldValidationErrors = this.state.formErrors;
    let emailValid = this.state.emailValid;
    let passwordValid = this.state.passwordValid;

    switch(fieldName) {
      case 'email':
        emailValid = value.match(/^([\w.%+-]+)@([\w-]+\.)+([\w]{2,})$/i);
        fieldValidationErrors.email = emailValid ? '' : `${this.state.email} isn't a valid email.`;
        break;
      case 'password':
        passwordValid = value.length >= 6;
        fieldValidationErrors.password = passwordValid ? '': 'Password too short';
        break;
      default:
        break;
    }
    this.setState({formErrors: fieldValidationErrors,
                    emailValid: emailValid,
                    passwordValid: passwordValid
                  }, this.validateForm);
  }

  validateForm() {
    this.setState({formValid: this.state.emailValid && this.state.passwordValid});
  }
  handleSubmit = (e) => {
    e.preventDefault()
    const { email, password } = this.state
    this.props.signUp({ email, password: password, password_confirmation: password })
  }

  render() {
    return (
        <Panel>
          <Panel.Heading>
            <Panel.Title componentClass="h3">Welcome!</Panel.Title>
          </Panel.Heading>
          <Panel.Body>
          <FormErrors formErrors={this.state.formErrors} />
            <form className='clearfix'>
              <FormGroup
                controlId="formEmail"
                className={`form-group ${this.errorClass(this.state.formErrors.email)}`}
              >
                <ControlLabel>Email:</ControlLabel>
                <FormControl
                  type="text"
                  name="email"
                  value={this.state.email}
                  placeholder="john@gmail.com"
                  onChange={(event) => this.handleUserInput(event)}
                />
                <FormControl.Feedback />
                <HelpBlock>
                  { this.state.formErrors.email }
                </HelpBlock>
              </FormGroup>
              <FormGroup
                controlId="formPassword"

                className={`form-group ${this.errorClass(this.state.formErrors.password)}`}
              >
                <ControlLabel>Password:</ControlLabel>
                  <FormControl
                    type="password"
                    name="password"
                    value={this.state.password}
                    placeholder="********"
                    onChange={(event) => this.handleUserInput(event)}
                  />
                  <FormControl.Feedback />
                  <HelpBlock>
                    { this.state.formErrors.password }
                  </HelpBlock>
                  <Button onClick={this.handleSubmit} disabled={!this.state.formValid} type="submit" className='pull-right'>Sign Up</Button>
              </FormGroup>
            </form>
          </Panel.Body>
        </Panel>
    )
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ signUp }, dispatch)
}

export default connect(null, mapDispatchToProps)(SignUpForm);
