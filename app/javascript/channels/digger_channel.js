import consumer from "channels/consumer"

consumer.subscriptions.create("DiggerChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let user_info = document.querySelector("#" + data.user_dom_id)
    let backpack = document.querySelector("#backpack")
    backpack.innerHTML = data.backpack
    user_info.innerHTML = data.user_info
  }
});
