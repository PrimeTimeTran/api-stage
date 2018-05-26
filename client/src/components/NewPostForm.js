import React, { Component } from 'react';
import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import client from '../utils/client'


import { addPost } from '../actions/PostActions';
import { ControlLabel, FormGroup, FormControl, InputGroup, Glyphicon } from 'react-bootstrap'

 class NewPostForm extends Component {
  constructor(props) {
    super(props)

    this.state = {
      body: '',
      media: null
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

  fileSelectedHandler = event => {
    console.log('Files: ', event.target.files);
    this.setState({ media: event.target.files[0] })
  }

  handleUploadHandler = () => {
    const request = client();
    const fd = new FormData();
    fd.append('uploads', this.state.media, this.state.media.name)
    request.post('http://localhost:3001/v1/posts', fd, {
      onUploadProgress: progressEvent => {
        console.log('Progress:' + Math.round((progressEvent.loaded / progressEvent.total * 100)) + '%' );
      }
    })
      .then(res => {
        console.log('Response: ', res);
    })
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
          type="file"
          label="File"
          help="Example block-level help text here."
          onChange={this.fileSelectedHandler}
        />
        <button onClick={this.handleUploadHandler}>Upload</button>
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