import React, { Component } from 'react';

import {
  Button,
  Col,
  form,
  FormControl,
  FormGroup,
} from "react-bootstrap";

class SignInForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      email: '',
      password: '',
      width: 0,
      height: 0,
    };
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

  handleSubmit(e) {
    e.preventDefault();
    const { email, password } = this.state
    this.props.signIn({ email, password })
    this.setState({ email: '', password: '' })
  }

  render() {
    const { authenticated, signOut } = this.props
    if (authenticated.token) {
      return <Button
        onClick={() => signOut()}
        bsStyle="primary"
        className={"navbar-form navbar-right"}
        inline="true">Sign Out
      </Button>
    } else {
      return (
        <form componentclass="fieldset" className={"navbar-form navbar-right"} inline="true" >
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

          <FormGroup>
            <Col sm={10}>
              <Button
                onClick={(e) => this.handleSubmit(e)}
                type="submit"
                bsStyle="primary"
                className={( this.state.width < 450 ? 'pull-right' : '')}
              >
                Sign in
              </Button>
            </Col>
          </FormGroup>
        </form>
      )
    }

  }
};

// function mapDispatchToProps(dispatch) {
//   return bindActionCreators({ signIn, signOut }, dispatch)
// }

export default SignInForm;