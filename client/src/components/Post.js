import React from 'react';
import Moment from 'react-moment';
import { Panel, DropdownButton, MenuItem } from 'react-bootstrap'

const Post = ({ post, onRemovePost }) => {
  return (
    <Panel bsStyle='primary' key={post.id}>
      <Panel.Heading style={styles.headerStyle} onclick={() => console.log('clicked')}>
        <Panel.Title componentClass='h3'>{post.user.first_name + ' ' + post.user.last_name}</Panel.Title>
        <Panel.Title componentClass='h3'>
          <Moment fromNow>
            {post.created_at}
          </Moment>

          {/* <Dropdown>
              <a className="" href="javascript: void(0)" >
                <Icon
                  type="ellipsis"
                  style={{
                    fontSize: 20,
                    fontWeight: 'bold',
                    color: '#808080',
                  }}
                />
              </a>
          </Dropdown> */}


            <DropdownButton

            >
                <MenuItem className="test" eventKey="1">Edit</MenuItem>
                <MenuItem divider />
                <MenuItem eventKey="2">Delete</MenuItem>
                <MenuItem eventKey="4">Separated link</MenuItem>
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

export { Post };