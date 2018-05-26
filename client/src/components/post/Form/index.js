import React, { Component } from 'react';
import axiosClient from '../axiosClient';
import './Index.css';

class PostForm extends Component {
  render() {
    return (
      <div className="PostForm">
        <form>
          <button
            onClick={e => this.handleFormSubmit()}
            className="btn btn-primary">
            Save
          </button>
          &nbsp;
          <button
            onClick={e => this.handleCancel()}
            className="btn btn-default">
            Cancel
          </button>
        </form>
      </div>
    );
  }

  handleCancel() {}
  handleFormSubmit() {}
}

export default PostForm;
