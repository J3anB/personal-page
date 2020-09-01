import Chart from 'chart.js';
// var myChart = new Chart(ctx, {...});


$(document).ready(function () {
// opened weather modal listener
    $('#exampleModal').on('shown.bs.modal', function () {
        initChart()
    });
    // $('button#openWeatherModal').on('click',
    //     function () {
    //         $('#exampleModal').modal()
    //     }
    // );
    $('button#weather_button').on(
        'click',
        function () {
            getWeather();
        }
    );
});

// weather view in navbar

function getWeather() {
    $.get($('#weather_button').data('link'), function (data) {
        $('#weather_city').html(data.city);
        $('#weather_temperature').html(data.temperature + '°c');
        $('#weather_humidity').html(data.humidity + '%');
        $('#weather_description').html(data.description);
        console.log(data);
    });
}

//Weather chart instantiation

function initChart() {
    dataChart().then(data => {
        var ctx = document.getElementById('myChart');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                datasets: [{
                    label: 'temperature',
                    data: iterTemperatureData(data),
                    backgroundColor: 'rgba(0, 0, 0, 0)',
                    borderColor: 'rgb(255,82,151)',
                    borderWidth: 1
                }, {
                    label: 'humidity',
                    data: iterHumidityData(data),
                    backgroundColor: 'rgba(0, 0, 0, 0)',
                    borderColor: 'rgb(81,88,240)',
                    borderWidth: 1,
                    yAxisID: 'humidityAxes',
                }],
            },
            options: {
                scales: {
                    xAxes: [{
                        type: 'time',
                        time: {
                            unit: 'day'
                        }
                    }],
                    yAxes: [
                        {
                            ticks: {
                                suggestedMin: -5,
                                suggestedMax: 4,
                                stepSize: 1,
                            }
                        },
                        {
                            id: 'humidityAxes',
                            position: 'right',
                            ticks:{
                                suggestedMin: 0,
                                suggestedMax: 100,
                            }
                        }]
                }
            }
        });
    });
}

//return 'promise' de la data
async function dataChart() {
    let res = await fetch('/weather/chart_request')
    let text = await res.json();
    return text
}

//Iterating weather data function
//execute fonction avec comme argument rawData (ce qui est récup en ajax (ligne de DB de dataWeather)
//On déclare un tableau vide dans lewuel on push et on itère selon les critères de 'chartJS'
//puis on return la final data

function iterTemperatureData(rawData) {
    let finalData = [];
    rawData.forEach(rawDatum => {
        finalData.push({x: rawDatum.created_at, y: rawDatum.temperature})
    });
    return finalData;
}

function iterHumidityData(rawData) {
    let finalData = [];
    rawData.forEach(rawDatum => {
        finalData.push({x: rawDatum.created_at, y: rawDatum.humidity})
    });
    return finalData;
}

