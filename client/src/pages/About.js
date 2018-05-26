import React, { Component } from 'react'
import { Container } from 'semantic-ui-react'

class About extends Component {
  componentWillMount() {
  }
  render () {
    return <Container text textAlign='center'>
      <h1>About me!</h1>
    </Container>
  }
}

export default About