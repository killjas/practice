<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script src="http://code.highcharts.com/modules/exporting.js"></script>


    <title>Аналитика</title>

    <script>
        var days = [<#list countUrlOfDay as day, count>"${day}",</#list>];
        var count = [<#list countUrlOfDay as day, count>${count},</#list>];
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
    </script>
</head>
<body>
<div id="site">
    <div>
        <h1>Аналитика</h1>
        <p>Аналитика запросов за последний месяц</p>
    </div>
    <#if countOfRequests <= 0>
        <p>За последний месяц запросов не было </p>
    <#else>
        <p>Всего запросов - ${countOfRequests}</p>
        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

        <p>По урлам</p>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">Адрес</th>
                <th scope="col">Количество запросов</th>
            </tr>
            </thead>
            <tbody>
            <#list countUrl as url,count>
                <tr>
                    <td>${url}</td>
                    <td><a href="#">${count} </a></td>
                </tr>
            </#list>
            </tbody>
        </table>

    </#if>

</div>
</body>
</html>