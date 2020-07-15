<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>Аналитика</title>
</head>
<body>
<div id="site">
    <div>
        <h1>Аналитика</h1>
        <p>Аналитика запросов за последний месяц</p>
    </div>
    <#if countRequests?has_content>
        <#list countRequests as url,count>
            <div> ${url}   ${count} </div>
        </#list>
    </#if>
</div>
</body>
</html>