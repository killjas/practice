<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <!-- JS, Popper.js, and jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
            integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
            integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
            crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>


    <title>Аналитика</title>

    <script>
        var days = [<#list countUrlOfDay as day, count>"${day}", </#list>];
        var count = [<#list countUrlOfDay as day, count>${count}, </#list>];
        console.log(days);
        $(function () {
            $('#container').highcharts({
                chart: {
                    type: 'column'
                },
                title: {
                    text: "Количество запросов за день"
                },
                xAxis: {
                    categories: days
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Количество запросов'
                    }
                },
                tooltip: {
                    headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                    pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                        '<td style="padding:0"><b>{point.y}</b></td></tr>',
                    footerFormat: '</table>',
                    shared: true,
                    useHTML: true
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0
                    }
                },
                series: [{
                    name: 'День',
                    data: count

                },]
            });
        });

        function f(url) {
            console.log(url);
            jQuery.ajax({
                type: "GET",
                url: "/analytics/more",
                data: url,
            });
        }
    </script>
    <style>
        .material-icons {
            color: #4d78e0;
        }

    </style>
</head>
<body>
<nav class="navbar">
    <p class="navbar-brand">
        Proxies
    </p>
</nav>
<div class="container">

    <div>
        <h1>Аналитика</h1>
        <p>Аналитика запросов за последний месяц</p>
    </div>
    <#if countOfRequests <= 0>
        <p>За последний месяц запросов не было </p>
    <#else>
        <p>Всего запросов - ${countOfRequests}</p>
        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

        <div class="accordion" id="accordionUrl">
            <div class="card">
                <div class="card-header" id="headingOne">

                    <div class="row">
                        <div class="col-9">Адрес</div>
                        <div class="col-3">Количество запросов</div>
                    </div>
                </div>
            </div>
            <#list countUrl as url,count>
                <div class="card">
                    <div class="card-header" id="heading${url?index}">
                        <h2 class="mb-0">
                            <button class="btn btn-link btn-block text-left collapsed" type="button"
                                    data-toggle="collapse"
                                    data-target="#collapse${url?index}" aria-expanded="false"
                                    aria-controls="collapse${url?index}">
                                <div class="row">
                                    <div class="col-9">${url}</div>
                                    <div class="col-3">${count}</div>
                                </div>
                            </button>
                        </h2>
                    </div>
                    <div id="collapse${url?index}" class="collapse" aria-labelledby="heading${url?index}"
                         data-parent="#accordionUrl">
                        <div class="card-body">
                            <#list detailedAnalytics as urlAddr, map>
                                <#if urlAddr == url>
                                    <#list map as date , ip>
                                        <div class="row">
                                            <div class="col-6">${ip}</div>
                                            <div class="col-6">${date}</div>
                                        </div>
                                    </#list>
                                </#if>
                            </#list>
                        </div>
                    </div>
                </div>
            </#list>
        </div>

    </#if>

</div>
</body>
</html>