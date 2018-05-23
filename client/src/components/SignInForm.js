import React, { Component } from 'react';
// import axios from 'axios';
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

  // onSubmit(e) {
  //   e.preventDefault()
  //   axios({
  //     method: 'post',
  //     url: `http://localhost:3001/api/v1/sessions`,
  //     data: {
  //       user: { email: 'datloiboi@gmail.com', password: 'asdfas' }
  //     }
  //   }).then(response => {
  //     console.log('Response: ', response)
  //   })
  // }

  updateWindowDimensions() {
    this.setState({ width: window.innerWidth, height: window.innerHeight });
  }

  render() {
    if (!this.props.isSignedIn) {
      return <Button bsStyle="primary" className={"navbar-form navbar-right"} inline="true">Sign Out</Button>
    }
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
            <Button type="submit" bsStyle="primary" className={( this.state.width < 450 ? 'pull-right' : '')}>
              Sign in
            </Button>
          </Col>
        </FormGroup>
      </form>
    )
  }
};

export default SignInForm;