<cfparam name="request.ODBC" default="cc_consumo">


<cfoutput>
  <!DOCTYPE html>
  <html>
    <head>
      <cfprocessingdirective pageencoding = "utf-8">
      <title>MTracker</title>
      <link href="css/justified-nav.css" rel="stylesheet">
    </head>
    <body>
      <div class="container">
      <!-- Jumbotron -->
      <div class="jumbotron">
        <h1>Bienvenido a #application.applicationname#</h1>
        <p class="lead">Selecciona tu vehiculo para consultar el consumo de combustible!</p>   
          <select id="machineid" name="machineid" class="form-control">
              <option value="">Marca
          </select><br>        
          <select id="machineid" name="machineid" class="form-control">
              <option value="">Modelo
          </select><br>  
          <select id="machineid" name="machineid" class="form-control">
              <option value="">Año
          </select><br>          
          <button class="default-primary-color btn btn-lg btn-primary btn-block " type="submit">Consultar</button>           
      </div>
      <!-- Site footer -->
      <footer class="footer">
        <p><a href="http://xikmaapps.com/">&copy; Xikma Apps</a> #year(now())#</p>
      </footer>
      </div> <!-- /container -->
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
      <script src="js/ie10-viewport-bug-workaround.js"></script>
    </body>
  </html>
</cfoutput>