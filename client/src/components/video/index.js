import React, { Component } from 'react';
import videojs from 'video.js';

import 'video.js/dist/video-js.css';

// HACK: To support videojs ad plugin
if (typeof (window) !== 'undefined') {
  window.videojs = videojs;
}

/**
 * NOTE: Because ad videos can be blocked,
 * we can't use a simple timer to reduce the count down,
 * now we use polling to get the currentTime of the ad video.
 */
export default class VideoPlayer extends Component {
  state = {
    prerollTotalTime: null,
    prerollPlayedTime: 0,
    isPlayingPrerollAds: false,
  }

  async componentDidMount() {
    if (this.props.getVideoInstance != null) {
      this.props.getVideoInstance(this);
    }
    if (typeof (document) !== 'undefined') {
      this.initialPlayer();
      this.player.src(this.props.src);
    }
  }

  componentWillUnmount() {
    this.disposePlayer();
  }

  shouldComponentUpdate(nextProps, nextState) {
    if (nextState === this.state) {
      return false;
    }
    return true;
  }

  initialPlayer() {
    const { controls } = this.props;
    this.player = videojs(this.$video, {
      controls,
      autoplay: true,
      preload: 'auto',
    });
  }

  disposePlayer() {
    if (this.player != null) {
      this.player.dispose();
    }
  }

  render() {
    const { src, height } = this.props;
    return (
      <div data-vjs-player>
        <video
          style={{
            height,
          }}
          ref={ref => (this.$video = ref)}
          // className={cls(className, 'video-js vjs-default-skin app-video')}
          src={src}
        >
          <p className="vjs-no-js">
            Your browser doesn't support playing this video.
          </p>
        </video>
      </div>
    );
  }
}
