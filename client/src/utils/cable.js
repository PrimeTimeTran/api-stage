import cable from 'actioncable';

let consumer;

function createChannel(...args) {
  let token = localStorage.getItem('auth_token');

  if (!consumer) {
    consumer = cable.createConsumer(`ws://localhost:3001/cable?token=${token}`);
  }

  return consumer.subscriptions.create(...args);
}

export default createChannel;