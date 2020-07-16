<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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

    </style>
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
</nav>
<p>Информация о сервере:</p>
<br>
<p>Загруженность ЦПУ: ${cpu} %</p>
<br>
<p>Используется оперативной памяти: ${VM} MB</p>
<br>
<p>Свободно памяти на диске: ${FS} MB</p>
</body>
</html>