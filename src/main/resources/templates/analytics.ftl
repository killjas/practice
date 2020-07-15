<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <title>Аналитика</title>
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
                <td>${count} </td>
            </tr>
        </#list>
            </tbody>
        </table>

        <p>По дням</p>
        <#list countUrlOfDay as day,count>
            <div> ${day}   ${count} </div>
        </#list>

    </#if>

</div>
</body>
</html>