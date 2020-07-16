<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
</head>
<style>
    .btn-primary {
        background-color: white;
        color: #4d78e0;
    }

    .btn-primary:hover,
    .btn-primary:focus,
    .btn-primary:visited {
        background-color: #4d78e0;
        color: white;
    }

    nav {
        background-color: #4d78e0;
    }

    h1 {
        font-size: 60pt;
    }

    p {
        color: #000000;
        margin-left: 4px;
    }
    .container{
        margin-top: 10%;
    }

</style>
<body>
<nav class="navbar">
    <br>
</nav>
<div>
    <main class="container">
        <br>
        <div class="row ">
            <div class="col text-center">
                <h1 style="color: #4d78e0">Proxies</h1>
            </div>
        </div>
        <div class="row justify-content-md-center">
            <div class="col-8">
                <p align="center"> Сервис, позволяющий анонимно просматривать вебсайты, доступ к которым
                    заблокирован
                    провайдером, либо же
                    ограничен
                    владельцем ресурса.</>
            </div>
        </div>
        <br>
        <form method="get" class="form">
            <div class="row justify-content-md-center">
                <div class="col-6">
                    <div class="form-group">
                        <input class="form-control" type="search" name="search" placeholder="Пример: https://github.com"
                               aria-label="Search">
                    </div>
                </div>
                <div class="col-2">
                    <button class="btn btn-primary my-2 my-sm-0" type="submit">Поиск</button>
                </div>
            </div>
            <div class="row">

            </div>
        </form>
    </main>
</div>
</body>
</html>