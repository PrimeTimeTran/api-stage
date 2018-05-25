import React, { Component } from 'react';
import {
  Button,
  Col,
  ControlLabel,
  Panel,
  FormControl,
  FormGroup,
  HelpBlock,
  Row,
  Well
} from 'react-bootstrap';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { Link } from 'react-router-dom'

import { initialPosts, removePost, signIn, signOut } from '../actions';

import { PostsContainer } from '../containers';
import NavigationPanel from '../components/Panel'
import NavbarContainer from '../containers/NavbarContainer';
import NewPostForm from '../components/NewPostForm';
// import { Container } from 'semantic-ui-react';

class Home extends Component {
  constructor(props) {
    super(props)
    this.state = {
      email: '',
      password: ''
    }
  }
  componentDidMount() {
    this.props.initialPosts();
  }

  componentWillUpdate() {
  }

  removePost(postId) {
    this.props.removePost(postId);
  }

  handleChange(e) {
    this.setState({ value: e.target.value })
  }


  getValidationState() {
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

          {
            authenticated.token && (
              <div>
                <Row className="show-grid">
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
              </div>
            )
          }
          {
            !authenticated.token && (
              <Row className="show-grid">
                <Col xs={12} md={8}>

                </Col>
                <Col xs={6} md={3}>
                <Well>
                  <form class='clearfix'>
                    <FormGroup
                      controlId="formBasicText"
                      validationState={this.getValidationState()}
                    >
                      <ControlLabel>Email:</ControlLabel>
                      <FormControl
                        type="text"
                        value={this.state.value}
                        placeholder="john@gmail.com"
                        onChange={e => this.setState({ email: e.target.value })}
                      />
                      <FormControl.Feedback />
                      <HelpBlock>Validation is based on string length.</HelpBlock>
                      <ControlLabel>Password:</ControlLabel>
                      <FormControl
                        type="text"
                        value={this.state.value}
                        placeholder="********"
                        onChange={e => this.setState({ password: e.target.value })}
                      />
                      <FormControl.Feedback />
                      <HelpBlock>Validation is based on string length.</HelpBlock>
                      <Button type="submit" className='pull-right'>Sign Up</Button>
                    </FormGroup>
                  </form>
                  </Well>
                </Col>
              </Row>
            )
          }

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
