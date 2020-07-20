<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
          integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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
        label{
            color: #4d78e0;
        }
    </style>
</head>
<body>
<div class="container">
    <br><br><br><br>
    <div class="row justify-content-md-center">
        <form action="/login" method="post">
            <div class="form-group">
                <label for="exampleInputEmail1" >Login</label>
                <input type="text" class="form-control" name="login">
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" name="password">
            </div>
            <button class="btn btn-primary my-2 my-sm-0" type="submit">Отправить</button>
        </form>
    </div>
</body>
</html>