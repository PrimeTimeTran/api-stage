import React, { Component } from 'react'
import { Container, Button } from 'semantic-ui-react'
import { Link } from 'react-router-dom'
// import user from '../assets/img/user-male.png';

class Messages extends Component {
  constructor(props) {
    super(props)
    this.state = {
      messages: []
    }
  }
  render () {
    return <Container text textAlign='center'>
      <h1>Messages</h1>
      <Button as={Link} to='/'>Back to home</Button>
    </Container>
  }
}

export default Messages