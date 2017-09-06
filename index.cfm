<cfparam name="request.ODBC" default="cc_consumo">
<cfparam name="request.user" default="">


<cfprocessingdirective pageencoding = "utf-8"/>

<cfoutput>
  <!DOCTYPE html>
  <html>
    <head>
      <title>Consumo Combustible</title>
      <link href="css/justified-nav.css" rel="stylesheet">
    </head>
    <body>
      <div class="jumbotron" id="formDiv">
        <cfif isdefined("request.user.quser.username")  and request.user.quser.username neq "">
          <h1>Bienvenido</h1><h2>#request.user.quser.username#</h2>
          <div class="g-signin2" data-onsuccess="onSignIn" id="iduser"></div> 
          <cfinclude template="userActions.cfm"/>
        <cfelse>
           <h1>#application.applicationname#</h1>
        
        </cfif>
        <cfinclude template="lookupCars.cfm">
      </div>
      <footer class="footer">
        <p><a href="http://xikmaapps.com/">&copy; Xikma Apps</a> #year(now())#</p>
      </footer>
 
      <!--- IE10 viewport hack for Surface/desktop Windows 8 bug
      <script src="js/ie10-viewport-bug-workaround.js"></script>--->
    
    </body>
  </html>
</cfoutput>
  <cfsetting showdebugoutput="yes">