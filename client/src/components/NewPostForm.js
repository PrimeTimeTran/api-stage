import React, { Component } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import { addPost } from '../actions/PostActions';
import { ControlLabel, FormGroup, FormControl, InputGroup, Glyphicon } from 'react-bootstrap'

import client from '../utils/client'
const request = client();
class NewPostForm extends Component {
  constructor(props) {
    super(props)

    this.state = {
      body: '',
      upload: null
    };

    this.handleChange = this.handleChange.bind(this);
  }

  getValidationState() {
    const length = this.state.body.length;
    if (length > 4) return 'success';
    else if (length > 2) return 'warning';
    else if (length > 0) return 'error';
    return null;
  }

  handleChange(e) {
    this.setState({ body: e.target.value });
  }

  handleFileSelect = event => {
    this.setState({ upload: event.target.files[0] })
  }

  handleSubmit = (e) => {
    e.preventDefault();
    const { authenticated } = this.props;

    const data = new FormData();
    data.append('upload', this.state.upload)
    data.append('body', this.state.body)
    data.append('user_id', authenticated.user.id)

    request.post('http://localhost:3000/v1/posts', data)
      .then(res => {
        console.log('Response', res)
      })
    this.setState({ body: '' })
    let randomString = Math.random().toString(36);
    this.setState({
      theInputKey: randomString
    });
  }

  render() {
    return (
      <form onClick={this.props._handleClick} onSubmit={(e) => this.handleSubmit(e)} style={{ marginTop: '1em' }}>
        <FormGroup
          controlId="postBody"
          validationState={this.getValidationState()}
        >
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
        </FormGroup>

        <FieldGroup
          id="postMedia"
          key={this.state.theInputKey || ''}
          type="file"
          label="File"
          help="Example block-level help text here."
          onChange={this.handleFileSelect}
        />
      </form>
    );
  }
};

function FieldGroup({ id, label, help, ...props }) {
  return (
    <FormGroup controlId={id}>
      <ControlLabel>{label}</ControlLabel>
      <FormControl {...props} />
    </FormGroup>
  );
}


function mapDispatchToProps(dispatch) {
  return bindActionCreators({ addPost }, dispatch)
}

export default connect(null, mapDispatchToProps)(NewPostForm)