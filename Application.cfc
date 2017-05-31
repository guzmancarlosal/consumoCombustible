<cfcomponent> 
<cfset This.name = "Consumo Combustible"> 
<cfset This.Sessionmanagement="True"> 
<cfset This.loginstorage="session"> 
 
<cffunction name="OnRequestStart"> 
    <cfoutput>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
        <script src="js/jquery-3.2.1.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" ></script>
        <link rel="stylesheet" href="fa/css/font-awesome.min.css">
        <link href="css/palette.css" rel="stylesheet">
        <cfinclude template="verification.cfm">
        <style>
           
            body {
                padding-top: 0px !important;
            }
        </style>
        <nav class="navbar navbar-toggleable-md navbar-inverse default-primary-color" style="">

          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="##navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
             
            <span class="navbar-toggler-icon"></span>
          </button>
          <a class="navbar-brand" href="index.cfm"><img src="img/logosm.jpg"> #this.name#</a>

          <div class="collapse navbar-collapse" id="navbarsExampleDefault">
           <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="https://www.xikmaapps.com"  target="_blank"><i class="fa fa-cubes" aria-hidden="true"></i>Desarrollador <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="https://www.youtube.com/gnzmgn" target="_blank"><i class="fa fa-youtube-play" aria-hidden="true"></i> Canal de youtube <span class="sr-only">(current)</span></a>
                    </li>
            </ul>

          </div>
        </nav>
    </cfoutput>
</cffunction> 

</cfcomponent>