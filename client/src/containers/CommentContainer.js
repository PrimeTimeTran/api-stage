import React, { Component } from 'react';

import Comment from '../components/comment';

class CommentContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      comments: props.comments
    }
  }

  render() {
    const { comments } = this.state
    return (
      <div>
        { comments && comments.map(comment => {
          return <Comment comment={comment} key={comment.id} />
        })}
        {/* <CommentForm onClick={addComment}/> */}
      </div>
    )
  }
};

export default CommentContainer;