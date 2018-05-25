import React, { Component } from 'react'
import { Container, Button } from 'semantic-ui-react'

class About extends Component {
  componentWillMount() {
    console.log('Loading About')
  }
  render () {
    return <Container text textAlign='center'>
      <h1>About me!</h1>
    </Container>
  }
}

export default About