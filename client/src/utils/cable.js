import cable from 'actioncable';

let consumer;
let backendHost;
const hostname = window && window.location && window.location.hostname;

if (hostname === 'localhost') {
  backendHost = 'localhost:3001';
} else {
  backendHost = 'lit-brushlands-65490.herokuapp.com';
}

function createChannel(...args) {
  let token = localStorage.getItem('auth_token');

  if (!consumer) {
    consumer = cable.createConsumer(`wss://${backendHost}/cable?token=${token}`);
  }

  return consumer.subscriptions.create(...args);
}

export default createChannel;