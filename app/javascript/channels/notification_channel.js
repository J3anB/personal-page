import consumer from "./consumer";

$(function () {
        consumer.subscriptions.create({channel: "NotificationChannel"},
            {
                received(data) {
                    display_welcome_message(data)
                }
            }
        )
    }
);

function display_welcome_message(data) {
    console.log(data);
    var toastId = document.getElementById("toast-id");
    var toastChild = toastId.children[0].cloneNode(true);
    toastChild.getElementsByClassName("toast-flash-time")[0].textContent = data.time;
    toastChild.getElementsByClassName("toast-flash-message")[0].textContent = data.message;
    document.getElementById('toast-place-holder').appendChild(toastChild);
    $('.toast').toast('show')
}
