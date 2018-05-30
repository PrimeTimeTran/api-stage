import React from 'react';

const Comment = ({ comment }) => {
  return (
    <div style={{ border: '1px solid red' }}>
      {comment.user.full_name}:
      {comment.body}
    </div>
  )
}

export default Comment;