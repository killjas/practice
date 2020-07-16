<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <#if site?has_content>
        <script>
            window.onload = function () {
                var server1 = "https//proxy-app-practice.herokuapp.com";
                var server2 = "http//localhost";
                jQuery('a[href]:not([href^="http"]):not([href^="//"])').each(function () {
                    jQuery(this).prop('href', "${site}" + jQuery(this).prop('href'))
                });

                jQuery('a[href]:not([href^="//"])').each(function () {
                    jQuery(this).prop('href', "/?search=" + jQuery(this).prop('href'))
                    jQuery(this).attr('href', jQuery(this).attr('href').replace(server1, ''))
                });
                jQuery('a[href^="//"]').each(function () {
                    jQuery(this).attr('href', jQuery(this).attr('href').replace('//', '/?search=https://'))
                });

                jQuery('link[href]:not([href^="http"]):not([href^="//"])').each(function () {
                    jQuery(this).prop('href', "${site}" + $(this).prop('href'))
                    jQuery(this).attr('href', jQuery(this).attr('href').replace('https://proxy-app-practice.herokuapp.com', ''))
                });
                jQuery('img[src]:not([src^="http"]):not([src^="//"])').each(function () {
                    jQuery(this).prop('src', "${site}" + $(this).prop('src'));
                    jQuery(this).attr('src', jQuery(this).attr('src').replace('http//', ''));
                    jQuery(this).attr('src', jQuery(this).attr('src').replace(server1, ''))
                });
                jQuery('image[src]:not([src^="http"]):not([src^="//"])').each(function () {
                    jQuery(this).prop('src', "${site}" + $(this).prop('src'))
                    jQuery(this).attr('src', jQuery(this).attr('src').replace(server1, ''))
                });

                var form_data = jQuery(this).serialize();
                var urlString = "${urlString}";
                console.log(form_data);

                jQuery.ajax({
                    type: "GET",
                    url: urlString,
                    data: form_data,
                    success: function (html) {
                        jQuery.ajax({
                            type: "POST",
                            url: "https://cors-anywhere.herokuapp.com/https://html2json.com/api/v1",
                            data: html,
                            success: function (json) {
                                jQuery(".convert-result").html('<pre>' + JSON.stringify(json.data || {}, null, 2) + '</pre>');
                            }
                        })
                    }
                });

                jQuery('body').on('submit', '#form-livedemo', function (e) {
                    e.preventDefault();
                    $('.hello').slideToggle(function () {
                        if ($(this).is(':hidden')) {
                            $('#buttonJson').html('HTML Format');
                            $("#site").hide()
                            $("#json").show()
                        } else {
                            $('#buttonJson').html('JSON Format');
                            $("#site").show()
                            $("#json").hide()
                        }
                    });
                });
            };
        </script>
    </#if>
    <style>
        nav {
            background-color: #4d78e0;
        }
        .btn-light {
            background-color: white;
            color: #4d78e0;
        }
        .btn-light:hover,
        .btn-light:focus,
        .btn-light:visited {
            background-color: white;
            color: #4d78e0;
        }

    </style>

</head>
<body>
<nav class="navbar fixed-top">
    <form method="get" class="form-inline">
        <input class="form-control mr-sm-2" type="search" name="search" placeholder="Пример: https://github.com" aria-label="Search">
        <button class="btn btn-light my-2 my-sm-0" type="submit">Поиск</button>
    </form>
    <div>
        <form id="form-livedemo" method="post">
            <button type="submit" class="btn btn-light my-2 my-sm-0" id="buttonJson">JSON Format</button>
        </form>
    </div>
</nav>
<div>
    <div class="forma">
        <form method="get" class="form-inline my-2 my-lg-0">
        </form>
    </div>
    <div id="site">
        <#if twin_site?has_content>
            <#list twin_site as map2,code>
                ${code}
            </#list>
        </#if>
    </div>
    <div class="convert-result" id="json" style="display: none">
    </div>
</div>
<h1 class="hello"></h1>
</body>
</html>