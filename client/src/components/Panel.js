import React, { Component } from 'react'
import {
  Glyphicon,
  ListGroup,
  ListGroupItem,
  Panel
} from 'react-bootstrap';

import { Link } from 'react-router-dom'

class NavigationPanel extends Component {
  render () {
    return (
      <Panel>
        <Panel.Heading>Panel heading</Panel.Heading>
        <ListGroup>
          <ListGroupItem>
            <Glyphicon glyph="envelope" style={styles.iconStyles} />
            <Link to="/messages">Messages</Link>
          </ListGroupItem>
          <ListGroupItem >
            <Glyphicon glyph="share-alt" style={styles.iconStyles} />
            <Link to="/about">About</Link>
          </ListGroupItem>
          <ListGroupItem>&hellip;</ListGroupItem>
        </ListGroup>
      </Panel>
    )
  }
}

const styles = {
  iconStyles: {
    marginRight: '5px'
  }
}

export default NavigationPanel