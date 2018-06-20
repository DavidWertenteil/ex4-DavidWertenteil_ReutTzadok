<%-- 
    Document   : list
    Created on : Jun 11, 2018, 12:35:36 PM
    Author     : davidwer, reutbar
--%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/login.css">
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>
    <body class="text-center">
        <form class="form-signin" action="Login" method="post">
            <input type="hidden" name="loginform" value="1"/>
            <img class="mb-4" src="https://cdn4.iconfinder.com/data/icons/business-and-office-5-3/128/211-256.png" alt="" width="72" height="72">
            <h1 class="h3 mb-3 font-weight-normal">Please enter your email</h1>
            <label for="exampleInputEmail1" class="sr-only">email</label>
            <input type="email" name="email" id="email" class="form-control" placeholder="email" required autofocus><br>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </form>
    </body>
</html>

