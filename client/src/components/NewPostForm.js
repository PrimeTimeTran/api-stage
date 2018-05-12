import React, { Component } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';

import { addPost } from '../actions/PostActions';
import { FormGroup, ControlLabel, FormControl, HelpBlock, InputGroup, Glyphicon } from 'react-bootstrap'

 class NewPostForm extends Component {
  constructor(props) {
    super(props)

    this.handleChange = this.handleChange.bind(this);

    this.state = {
      body: ''
    };
  }

  getValidationState() {
    const length = this.state.body.length;
    if (length > 10) return 'success';
    else if (length > 5) return 'warning';
    else if (length > 0) return 'error';
    return null;
  }

  handleChange(e) {
    this.setState({ body: e.target.value });
  }

  handleSubmit(e) {
    e.preventDefault()
    const postLength = e.target.querySelector("input").value.length

    if (postLength > 1) {
      this.props.addPost({ body: this.state.body, user_id: 1 })
      this.setState({ body: '' });
    }
  }

  render() {
    return (
      <form onClick={this.props._handleClick} onSubmit={(e) => this.handleSubmit(e)}>
        <FormGroup
          controlId="formBasicText"
          validationState={this.getValidationState()}
        >
          <ControlLabel>Working example with validation</ControlLabel>
          <InputGroup>
            <InputGroup.Addon><Glyphicon glyph="pencil" /></InputGroup.Addon>
              <FormControl
                type="text"
                value={this.state.body}
                placeholder="Enter text"
                onChange={this.handleChange}
              />
          </InputGroup>
          <FormControl.Feedback />
          <HelpBlock>Validation is based on string length.</HelpBlock>
        </FormGroup>
      </form>
    );
  }
};

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ addPost }, dispatch)
}

export default connect(null, mapDispatchToProps)(NewPostForm)