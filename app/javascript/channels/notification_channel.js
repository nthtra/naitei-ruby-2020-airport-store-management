import consumer from "./consumer"

consumer.subscriptions.create("NotificationChannel", {
  connected() {
    console.log("Connected")
  },

  disconnected() {

  },

  received(data) {
    
    if ($(`#${data.to}`)[0]) {
      $(`#${data.to}`)[0].innerHTML = data.notification_quantity
      toastr.info(I18n.t("notifications.list_noti.message"))
    }

    if ($(`#${data.count}`)[0]) {
      $(`#${data.count}`)[0].innerHTML = data.notification_quantity
    }
  }
});
