import React, { Component } from 'react';
import { Grid, Row, Col } from 'react-bootstrap';

import './App.css';
import NavbarContainer from './components/NavbarContainer'

class App extends Component {
  render() {
    return (
        <div>
          <NavbarContainer />
          <Grid>
            <Row className="show-grid">
              <Col xs={12} md={12} style={{ backgroundColor: 'yellow' }}>
                Welcome!
              </Col>
            </Row>
          </Grid>
        </div>
    );
  }
}

export default App;
