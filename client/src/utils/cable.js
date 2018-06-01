import cable from 'actioncable';

let consumer;
let backendHost;
let socketType;
const hostname = window && window.location && window.location.hostname;

if (hostname === 'localhost') {
  backendHost = 'localhost:3001';
  socketType = 'ws';
} else {
  backendHost = 'lit-brushlands-65490.herokuapp.com';
  socketType = 'wss';
}

function createChannel(...args) {
  let token = localStorage.getItem('auth_token');

  if (!consumer) {
    consumer = cable.createConsumer(`${socketType}://${backendHost}/cable?token=${token}`);
  }

  return consumer.subscriptions.create(...args);
}

export default createChannel;