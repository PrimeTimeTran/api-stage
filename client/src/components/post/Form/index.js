import React, { Component } from 'react';

class PostForm extends Component {
  state = {
    selectedPostCoverFiles: [],
    submitFormProgress: 0,
    isSubmittingForm: false,
    didFormSubmissionComplete: false,
    post: {
      id: this.props.match.params.id,
      title: '',
      description: '',
      errors: {}
    }
  };

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
