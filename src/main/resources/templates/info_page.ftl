<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        nav {
            background-color: #4d78e0;
        }

        .navbar-brand {
            color: white;
        }

        .nav-link {
            color: white;
        }

        .btn-primary {
            background-color: white;
            color: #4d78e0;
        }

        .container {
            margin-top: 10%;
        }

    </style>
    <script>
        window.onload = function () {
            jQuery('body').on('click', '#form-livedemo', function (e) {
                e.preventDefault();
                $('.hello').slideToggle(function () {
                    if ($(this).is(':hidden')) {
                        $('#buttonJson').html('HTML Format');
                        $("#htmlview").hide()
                        $("#jsonview").show()
                    } else {
                        $('#buttonJson').html('JSON Format');
                        $("#htmlview").show()
                        $("#jsonview").hide()
                    }
                });
            });
        }
    </script>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <h2><a class="navbar-brand" href="/">
                Proxies
            </a></h2>
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/system/info">Информация о сервере</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/system/analytics">Аналитика</a>
            </li>
        </ul>
    </div>
    <form id="form-livedemo" method="post">
        <button type="submit" class="btn btn-primary " id="buttonJson">JSON Format</button>
    </form>
</nav>
<div class="container">
    <h1 class="h1" align="center">Информация о сервере:</h1>
    <br>
    <div id="htmlview">
        <script>
            var cpu = parseInt("${cpu}", 10);
            cpu = Math.round(cpu);
            if (cpu > 25) {
                document.write("<div class = \"alert alert-danger\" role = \"alert\" >\n" +
                    "            <p> Загруженность ЦПУ:" + cpu + "% </p>\n" +
                    "        </div>")
            }
            if (cpu <= 25) {
                document.write("<div class=\"alert alert-success\" role=\"alert\">\n" +
                    "    <p>Загруженность ЦПУ: " + cpu + " % </p>\n" +
                    "</div>")
            }

        </script>
        <div class="alert alert-success" role="alert">
            <p>Используется оперативной памяти: ${VM} MB</p>
        </div>
        <div class="alert alert-success" role="alert">
            <p>Свободно памяти на диске: ${FS} MB</p>
        </div>
    </div>
    <div id="jsonview" style="display: none">
        <pre> {<br>  "info" : { <br>     "system" : [ <br>       {<br>         "cpu": "${cpu}" <br>       },<br>       { <br>         "VirtualMemory" : "${VM}" <br>       }, <br>       {<br>         "FreeSpace" : ${FS}"<br>       }<br>     ]<br>   }<br> }</pre>
    </div>
    <h1 class="hello"></h1>
</div>
</body>
</html>