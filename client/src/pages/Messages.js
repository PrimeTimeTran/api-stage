import React, { Component } from 'react'
import { Button } from 'semantic-ui-react'
import {
  Col,
  Row
} from 'react-bootstrap';
import { sendMessage } from "../utils/chat";

import NavbarContainer from '../containers/NavbarContainer';
// import user from '../assets/img/user-male.png';

class Messages extends Component {
  constructor(props) {
    super(props)
    this.state = {
      messages: []
    }
  }

  componentDidMount() {
  }

  handleSubmit = (e) => {
    e.preventDefault();
    sendMessage('Go')
  }

  render () {
    return <div className="container-messages">
      <NavbarContainer />
      <div style={styles.trick} />
          { (true) ?
            <Row>

              <Col xsHidden md={2} style={styles.leftSideBar}>
              s
              </Col>

              <Col xs={12} md={8} style={styles.middleSideBar}>
                <form>
                  <Button
                    onClick={e => this.handleSubmit(e)}
                  >
                    Back to home
                  </Button>
                </form>
              </Col>

              <Col xsHidden md={2} style={styles.rightSideBar}>
                Ads
              </Col>

            </Row>
          : <Row>
              <Col xs={12} md={8} />
              <Col xs={12} md={4} style={{ marginTop: '5em', paddingRight: '5em'}}>
              </Col>
            </Row>
          }
    </div>
  }
}

const styles = {
  navBar: {
    position: 'fixed',
    height: '40px',
    width: '100%',
    zIndex: 2
  },
  trick: {
    maxWidth: '1170px',
    margin: '0 auto',
  },
  leftSideBar: {
    position: 'fixed',
    top: '50px',
    left: 0,
    backgroundColor: 'red'
  },
  middleSideBar: {
    margin: '0 10em',
    top: '50px',
    backgroundColor: 'blue'
  },
  rightSideBar: {
    position: 'absolute',
    top: '50px',
    right: 0,
    backgroundColor: 'yellow'
  }
}

export default Messages