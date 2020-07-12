<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <#if site?has_content>
    <script>
        window. onload=function(){
            $('a[href]:not([href^="http"])').each(function() {
                $(this).prop('href', "${site}" + $(this).prop('href'))
            });
            $('a').each(function() {
                $(this).prop('href', "/?search=" + $(this).prop('href'))
                $(this).attr('href', $(this).attr('href').replace('http//localhost', ''))
            });
            <#--$('img[src]:not([src^="http"])').each(function() {-->
                <#--$(this).prop('src', "${site}" + $(this).prop('src'))-->
                <#--$(this).attr('src', $(this).attr('src').replace('http//localhost', ''))-->
            <#--});-->
            <#--$('img').each(function() {-->
                <#--$(this).attr('src', $(this).attr('src').replace('http//localhost', ''))-->
            <#--});-->
        }
    </script>
    </#if>
</head>
<body>
<div>
    <h1>Hello!</h1>
    <form method="get" class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
    <#if twin_site?has_content>
    <#list twin_site as map2,code>
        ${code}
    </#list>
    </#if>
</div>
</body>
</html>