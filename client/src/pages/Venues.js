import React, { Component } from 'react'
import { Container, Button } from 'semantic-ui-react'
import { Link } from 'react-router-dom'
import { venues, likeVenue } from '../actions';

class Venues extends Component {
  constructor(props) {
    super(props)
    this.state = {
      venues: []
    }
  }
  render () {
    return <Container text textAlign='center'>
      <h1>Venues</h1>
      <Button as={Link} to='/'>Back to home</Button>
    </Container>
  }
}

const mapReduxStateToProps = ({ posts, authenticated }) => {
  return { posts, authenticated };
};

export default connect(mapReduxStateToProps, mapDispatchToProps)(Venues);
