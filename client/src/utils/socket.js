import ActionCable from "actioncable";

const createSocket = () => {
  let cable = ActionCable.createConsumer('ws://localhost:3001/cable');

  cable.subscriptions.create('MessagesChannel', {
    connected: function() {
      console.log('Connected in side')
    },
    received: function(data) {
    },
    disconnected: function(){
    }
  });
}

export default createSocket;