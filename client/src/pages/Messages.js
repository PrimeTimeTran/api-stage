import React, { Component } from 'react'
import { Container, Button } from 'semantic-ui-react'
import { Link } from 'react-router-dom'
import user from '../assets/img/user-male.png';

class NotFound extends Component {
  render () {
    return <Container text textAlign='center'>
      <h1>Messages</h1>
      <Button as={Link} to='/'>Back to home</Button>
      <img src={user} alt="user" style={{ height: 100, width: 100}}/>
    </Container>
  }
}

export default NotFound