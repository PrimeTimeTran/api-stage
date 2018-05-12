import React from 'react';
import Moment from 'react-moment';
import { Panel } from 'react-bootstrap'

const Post = ({ post, onRemoveList }) => {
  console.log('User: ', post.user)
  return (
    <Panel bsStyle='primary' key={post.id}>
      <Panel.Heading style={styles.headerStyle} onClick={() => onRemoveList(post.id)}>
        <Panel.Title componentClass='h3'>{post.user.first_name + ' ' + post.user.last_name}</Panel.Title>
        <Panel.Title componentClass='h3'>
          <Moment fromNow>
            {post.created_at}
          </Moment>
        </Panel.Title>
      </Panel.Heading>
      <Panel.Body style={styles.alignLeft}>{post.body}</Panel.Body>
    </Panel>
  )
}

const styles = {
  headerStyle: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between'
  },
  alignLeft: {
    textAlign: 'left'
  }
}

export default Post;