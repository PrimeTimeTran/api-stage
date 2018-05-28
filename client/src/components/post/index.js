import React from 'react';
import Moment from 'react-moment';
import { Panel, DropdownButton, MenuItem } from 'react-bootstrap'

const Post = ({ post, onRemovePost }) => {
  return (
    <Panel bsStyle='primary' key={post.id}>
      <Panel.Heading style={styles.header} onClick={() => console.log('clicked')}>
        <Panel.Title componentClass='h3'>{post.user.full_name}</Panel.Title>
        <Panel.Title componentClass='h3'>
          <Moment fromNow id='post'>
            {post.created_at}
          </Moment>

          <DropdownButton
            title={ <span><i className="glyphicon glyphicon-option-horizontal"></i></span> }
            id={post.id}
            pullRight
            noCaret
            style={styles.menu}
          >
            <MenuItem>
              <i className="glyphicon glyphicon-pencil"></i> Edit
            </MenuItem>
            <MenuItem>
              <i className="glyphicon glyphicon-trash"></i> Delete
            </MenuItem>
          </DropdownButton>

        </Panel.Title>
      </Panel.Heading>
      <Panel.Body style={styles.alignLeft}>{post.body}</Panel.Body>
    </Panel>
  )
}

const styles = {
  header: {
    display: 'flex',
    flexDirection: 'row',
    justifyContent: 'space-between'
  },
  alignLeft: {
    textAlign: 'left'
  },
  menu: {
    boxShadow: 'none',
    background: 'none',
    border: 'none',
    padding: 0,
    color: 'white',
    marginLeft: '2em'
  }
}

export default Post;