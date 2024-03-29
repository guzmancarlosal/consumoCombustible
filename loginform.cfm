<cfparam name="errormsj" default="">
<cfoutput>
<!DOCTYPE html>
<html>
  <head>
    <cfprocessingdirective pageencoding = "utf-8">
    <link rel="icon" href="img/logo.png">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
    
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
     <link href="css/palette.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/> 
    <style>
      .btn-primary,
      .btn-primary:hover,
      .btn-primary:active,
      .btn-primary:visited,
      .btn-primary:focus {
          background-color: ##4CAF50;
          border-color: ##4CAF50;
      }
    </style>
  </head>

  <body>

    <div class="container text-center">
      
      <form class="form-signin" action="#CGI.script_name#?#CGI.query_string#" method="Post">
        <img src="img/logo.png">
        <h2 class="form-signin-heading">Consumo Combustible</h2>
        <h3 class="form-signin-heading"></h2>
        <label for="inputEmail" class="sr-only">Usuario</label>
        <input type="text" id="j_username" name="j_username" class="form-control" placeholder="Usuario" required autofocus><Br>
        <label for="inputPassword" class="sr-only">Contraseña</label>
        <input type="password" id="j_password" name="j_password" class="form-control" placeholder="Contraseña" required>
        <div class="checkbox">
            <cfoutput>#errorMsj#</cfoutput>
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Recuérdame
          </label>
        </div>
        <button class="default-primary-color btn btn-lg btn-primary btn-block " type="submit">Entrar</button>
      </form>
    <div class="container text-center">
    ¿Qué es Consumo Combustible? <a href="http://xikmaapps.com/">da click aquí</a> para obtener más información
    </div>
    </div> <!-- /container -->

    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
</cfoutput>
