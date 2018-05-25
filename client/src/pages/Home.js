import React, { Component } from 'react';
import {
  Button,
  Col,
  ControlLabel,
  Panel,
  FormControl,
  FormGroup,
  HelpBlock,
  Row
} from 'react-bootstrap';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
// import { Link } from 'react-router-dom'

import { initialPosts, removePost, signIn, signOut } from '../actions';

import { PostsContainer } from '../containers';
import NavigationPanel from '../components/Panel'
import NavbarContainer from '../containers/NavbarContainer';
import NewPostForm from '../components/NewPostForm';
import '../components/FormErrors';
// import { Container } from 'semantic-ui-react';

class Home extends Component {
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

  componentDidMount() {
    this.props.initialPosts();
  }

  removePost(postId) {
    this.props.removePost(postId);
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
      fieldValidationErrors.password = passwordValid ? '': 'Invalid password.';
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

  render() {
    const { authenticated, posts, signIn, signOut } = this.props

    return (
      <div>
        <NavbarContainer
          signIn={signIn}
          signOut={signOut}
          authenticated={authenticated}
        />
        <div className="main-content">
          <div className="container">
            {
              (authenticated.token) ?
                <Row>
                  <Col xsHidden md={2} mdOffset={1}>
                    <NavigationPanel />
                  </Col>
                  <Col xs={12} md={6}>
                    <NewPostForm />
                    <PostsContainer posts={posts} onRemovePost={this.removePost.bind(this)}/>
                  </Col>
                  <Col xsHidden md={2} style={{ backgroundColor: '#7caeff' }}>
                    Ads
                  </Col>
                </Row>
              : <Row>
                  <Col xs={12} md={8}>
                  </Col>
                  <Col xs={6} md={4}>
                    <Panel>
                      <Panel.Heading>
                        <Panel.Title componentClass="h3">Welcome!</Panel.Title>
                      </Panel.Heading>
                      <Panel.Body>
                        <form className='clearfix'>
                          <FormGroup
                            controlId="formBasicText"

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
                            controlId="formBasicText"

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
                              <Button disabled={!this.state.formValid} type="submit" className='pull-right'>Sign Up</Button>
                          </FormGroup>
                        </form>
                      </Panel.Body>
                    </Panel>
                  </Col>
                </Row>
            }
          </div>
        </div>
      </div>
      )
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({
    removePost, initialPosts, signIn, signOut }, dispatch)
}

const mapReduxStateToProps = ({ posts, authenticated }) => {
  return { posts, authenticated };
};

export default connect(mapReduxStateToProps, mapDispatchToProps)(Home);
