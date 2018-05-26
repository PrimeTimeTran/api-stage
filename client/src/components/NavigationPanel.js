import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import {
  Glyphicon,
  ListGroup,
  ListGroupItem,
  Panel
} from 'react-bootstrap';



class NavigationPanel extends Component {
  render () {
    return (
      <Panel style={{ marginTop: '1em' }}>
        <Panel.Heading>Panel heading</Panel.Heading>
        <ListGroup>
        <ListGroupItem>
            <Glyphicon glyph="share-alt" style={styles.iconStyles} />
            <Link to="/about">Friends</Link>
          </ListGroupItem>
          <ListGroupItem>
            <Glyphicon glyph="envelope" style={styles.iconStyles} />
            <Link to="/messages">Messages</Link>
          </ListGroupItem>
          <ListGroupItem>
            <Glyphicon glyph="share-alt" style={styles.iconStyles} />
            <Link to="/about">Groups</Link>
          </ListGroupItem>
          <ListGroupItem>
            <Glyphicon glyph="share-alt" style={styles.iconStyles} />
            <Link to="/about">Venues</Link>
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

export default NavigationPanel;
