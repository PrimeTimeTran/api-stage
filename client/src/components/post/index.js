import React from 'react';
import Moment from 'react-moment';
import { Button, Glyphicon, Panel, ButtonGroup, DropdownButton, MenuItem } from 'react-bootstrap'

const Post = ({ post, onRemovePost }) => {
  return (
    <Panel bsStyle='primary' key={post.id}>
      <Panel.Heading style={styles.headerStyle} onClick={() => console.log('clicked')}>
        <Panel.Title componentClass='h3'>{post.user.first_name + ' ' + post.user.last_name}</Panel.Title>
        <Panel.Title componentClass='h3'>
          <Moment fromNow id='post'>
            {post.created_at}
          </Moment>

          <DropdownButton
            pullRight
            eventKey={3}
            title={
              <span><i className="glyphicon glyphicon-option-horizontal"></i></span>
            }
            style={{ background: '#008cba', border: 'none' }}
          >
            <MenuItem eventKey='1'>
              <i className="glyphicon glyphicon-pencil"></i> Edit
            </MenuItem>
            <MenuItem eventKey='2'>
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