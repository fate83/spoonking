import consumer from "channels/consumer"

consumer.subscriptions.create("DiggerChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let element = document.querySelector("#resources")
    element.innerHTML = data.body
  }
});
