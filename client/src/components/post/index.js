import React from 'react';
import Moment from 'react-moment';
import { Panel, DropdownButton, MenuItem, Image } from 'react-bootstrap'

import CommentContainer from '../../containers/CommentContainer';

const Post = ({ post, comments, onRemovePost }) => {
  const avatar = post.user.avatar_url
  const oneMedia = post.uploads.length === 1

  return (
    <Panel bsStyle='primary' key={post.id}>
      <Panel.Heading style={styles.header} onClick={() => console.log('clicked')}>
        <div style={{ display: 'flex', flexDirection: 'row' }}>
          <Image src={avatar} circle style={{ height: '50px', width: '50px'}}/>
          <Panel.Title componentClass='h3' style={{ marginLeft: '5px' }}>{post.user.full_name}</Panel.Title>
        </div>
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

        {/* Refused to display in a frame because it set 'X-Frame-Options' to 'sameorigin'. */}
        {console.log(post.uploads[0])}

        { (oneMedia) && (post.uploads[0].media_type === 'img') && <div>
            <Image src={post.uploads[0].url} rounded style={{ height: '15em', width: '15em'}}/> { console.log(post.uploads[0]) }
          </div>
        }
        { (oneMedia) && (post.uploads[0].media_type === 'video') && <div>
            <div className="embed-responsive embed-responsive-16by9">
              <iframe className="embed-responsive-item" src={post.uploads[0].url} id={post.uploads[0].id}>
              </iframe>
            </div>
          </div>
        }
      <CommentContainer
        post={post}
        comments={post.comments}
      />
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