import ActionCable from "actioncable";

const createSocket = () => {
  console.log('Creating Socket')
  let cable = ActionCable.createConsumer('ws://localhost:3001/cable');

  cable.subscriptions.create('MessagesChannel', {
    connected: function() {
    },
    received: function(data) {
    },
    disconnected: function(){
    }
  });
}

export default createSocket;