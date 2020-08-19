import $ from 'jquery';

$(document).ready(function () {
    $('button#weather_button').on(
        'click',
        function () {
            getWeather();
        }
    );
});

function getWeather() {
    $.get($('#weather_button').data('link'), function (data) {
        $('#weather_city').html(data.city);
        $('#weather_temperature').html(data.temperature);
        $('#weather_humidity').html(data.humidity);
        $('#weather_description').html(data.description);
        console.log(data);
    });
}

