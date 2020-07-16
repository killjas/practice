<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
                    jQuery(this).attr('href', jQuery(this).attr('href').replace(server2, ''))
                });
                jQuery('a[href^="//"]').each(function () {
                    jQuery(this).attr('href', jQuery(this).attr('href').replace('//', '/?search=https://'))
                });

                jQuery('link[href]:not([href^="http"]):not([href^="//"])').each(function () {
                    jQuery(this).prop('href', "${site}" + $(this).prop('href'))
                    jQuery(this).attr('href', jQuery(this).attr('href').replace('http://localhost', ''))
                });
                jQuery('img[src]:not([src^="http"]):not([src^="//"])').each(function () {
                    jQuery(this).prop('src', "${site}" + $(this).prop('src'));
                    jQuery(this).attr('src', jQuery(this).attr('src').replace('http//', ''));
                    jQuery(this).attr('src', jQuery(this).attr('src').replace(server2, ''))
                });
                jQuery('image[src]:not([src^="http"]):not([src^="//"])').each(function () {
                    jQuery(this).prop('src', "${site}" + $(this).prop('src'))
                    jQuery(this).attr('src', jQuery(this).attr('src').replace(server2, ''))
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
        .navbar-mybar {
            background-color: #4d78e0;
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            -ms-flex-align: center;
            align-items: center;
            -ms-flex-pack: justify;
            justify-content: space-between;
            padding: 0.5rem 1rem;
        }
        .btn-btn-light-my-btn {
            background-color: white;
            color: #4d78e0;
            display: inline-block;
            font-weight: 400;
            text-align: center;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            border: 1px solid transparent;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.25rem;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        .btn-btn-light-my-btn:hover,
        .btn-btn-light-my-btn:focus,
        .btn-btn-light-my-btn:visited {
            background-color: white;
            color: #4d78e0;

        }
        .form-control-control-form{
            display: block;
            width: 70%;
            height: calc(1.5em + 0.75rem + 2px);
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        .form-inline-myline{
            display: -ms-flexbox;
            display: flex;
            -ms-flex-flow: row wrap;
            flex-flow: row wrap;
            -ms-flex-align: center;
            align-items: center;
            width: 50%;
        }
        .form-inline-myline.form-control-control-form{
            display: inline-block;
            width: auto;
            vertical-align: middle;
        }
    </style>

</head>
<body>
<nav class="navbar-mybar">
    <form method="get" class="form-inline-myline">
        <input class="form-control-control-form" type="search" name="search" placeholder="Пример: https://github.com" aria-label="Search">
        <button class="btn-btn-light-my-btn" type="submit">Поиск</button>
    </form>
    <form id="form-livedemo" method="post">
        <button type="submit" class="btn-btn-light-my-btn" id="buttonJson">JSON Format</button>
    </form>
</nav>
<br>
<main id="site">
    <#if twin_site?has_content>
        <#list twin_site as map2,code>
            ${code}
        </#list>
    </#if>
</main>
<div class="convert-result" id="json" style="display: none">
</div>
<h1 class="hello"></h1>
</body>
</html>