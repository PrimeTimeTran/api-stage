import React, { Component } from 'react';
import BookForm from '../Form';

class PostEdit extends Component {
  render() {
    return (
      <div className="PostEdit col-md-8 col-md-offset-2">
        <h2>Edit Book</h2>
        <BookForm history={this.props.history} match={this.props.match} />
      </div>
    );
  }
}

export default PostEdit;
