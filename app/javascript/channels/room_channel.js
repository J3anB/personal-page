import consumer from "./consumer";

$(function () {
    $('[data-channel-subscribe="room"]').each(function (index, element) {
        var $element = $(element),
            room_id = $element.data('room-id'),
            messageTemplate = $('[data-role="message-template"]');
        //
        $element.animate({scrollTop: $element.prop("scrollHeight")}, 1000);
        var roomChannel = consumer.subscriptions.create(
            {
                channel: "RoomChannel",
                room: room_id
            },
            {
                received: function (data) {
                    if (data.all_users !== undefined) {
                        display_connected_users(data)
                    } else {
                        var content = messageTemplate.children().clone(true, true);
                        content.find('[data-role="user-username"]').text(data.user);
                        content.find('[data-role="message-text"]').text(data.message);
                        content.find('[data-role="message-date"]').text(data.message_date);
                        $element.append(content);
                        $element.animate({scrollTop: $element.prop("scrollHeight")}, 1000);
                    }
                },
                connected: function () {

                    $('#new_room_message').on('submit', function () {
                        var myForm = $('#new_room_message');
                        var messageToSend = myForm.find('#message').val();
                        roomChannel.send({body: messageToSend});
                        myForm.find('#message').val('');
                    });
                }
            }
        );
    });
});

function display_connected_users(data) {
    $('#connected-users-placeholder').text(data.all_users.length);
    var connected_user_list = $('#connected-users-list');
    connected_user_list.html('');
    data.all_users.forEach(element => {
        var connected_users_template = $('[data-role="connected-user-template"]');
        var content = connected_users_template.children().clone(true, true);
        content.text(element);
        connected_user_list.append(content)
    });
}


//dans la fonction:
// on vient selectionner grace à un selecteur le chat:"data-channel-subscribe"
// que l'on retrouve dans appelé dans le "show"
//grace à Jquery, on lis le room ID sur lequel on est actuellement => "room_id"
//on prends le template qffichés dans le message grace à "message-template" dans le show
// grace à "consumuer" on ouvre un websocket avec rails, => navigateur qui ouvre une connexion directe avec Rails => le websocket (similaire à ajax,
// mais contrairement à ajax qui effectue une seule requete et une seule reponse, le websocket c'est une connexion qui reste ouverte
//websocket orienté evenements => navigateur écoute en continue ce qui se passe sur le channel (Room)


//la fonction received détermine l'action Js suite à l'info reçue par le serveur


// déclarer une fonction =>