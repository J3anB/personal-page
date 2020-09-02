$(function () {
    $(document).on('ajax:success', '#new_room_message', function (a, b, c) {
        $(this).find('textarea').val('');
    });
});

//document => existe par défault, et représente le doc HTML
//dans la fonction on select le bouton "new_room_message", on ajoute un listener dessu "ajax:success"
//puis le "this" représente le selecteur ",new_room_message"

//".on" => attacher un écouteur d'event
//ajax:success intervient quand il y a une réponse successful d'une requête ajax