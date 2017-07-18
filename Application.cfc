<cfcomponent> 
<cfset This.name = "Consumo Combustible"> 
<cfset This.Sessionmanagement="True"> 
<cfset This.loginstorage="session"> 
<cfparam name="request.ODBC" default="cc_consumo">
<cffunction name="OnRequestStart"> 
    <cfif IsDefined("form.logout")> 
        <cflogout> 
    </cfif> 
    <cfparam name="url.email" default="">
    <cfparam name="url.name" default="">

    <cfif url.email neq "">
        <cfset userObj = createObject("component","library.user").init(odbc=request.ODBC)>
        <cfset qUser = userObj.getUser(id=url.email)>
        <cfif qUser.recordcount eq 0>
          <cfset qUser = userObj.addUser(username=trim(url.name), type="1", email=trim(url.email))>
        </cfif>
        <cfset request.user.qUser = userObj.getUser(id=url.email)>
        <cfset request.userObj = createObject("component","library.user").init(odbc=request.ODBC)>
        <cflogin>
            <cfloginuser name="#url.email#" Password = "1234" roles="#qUser.type#">
        </cflogin> 
    </cfif>
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
          <a class="navbar-brand" href="index.cfm?email=#url.email#"><img src="img/logo.png"> #this.name#</a>

          <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="https://www.xikmaapps.com"  target="_blank"><i class="fa fa-cubes" aria-hidden="true"></i>Desarrollador <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="https://www.youtube.com/gnzmgn" target="_blank"><i class="fa fa-youtube-play" aria-hidden="true"></i> Canal de youtube <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <a class="nav-link" style="color:white" id="topBarName"></a>
             <a class="nav-link" style="color:white"><b>#GetAuthUser()#</b></a>
            <cfif #GetAuthUser()# neq "">
                <form class="form-inline my-2 my-md-0" id="logoutForm" name="logoutForm" action="index.cfm" method="Post">
                    <input type="hidden" id="logout" name="logout">
                    <button class="btn btn-default" type="submit" onClick="logoutForm.submit();">Salir</button>
                </form>  
            </cfif>
          </div>
        </nav>

    </cfoutput>
</cffunction> 
<cffunction name="onError"> 
    <cfargument name="Exception" required=true/> 
    <cfargument type="String" name="EventName" required=true/> 
    <!--- Log all errors. ---> 
    <cflog file="#This.Name#" type="error"  
            text="Event Name: #Arguments.Eventname#" > 
    <cflog file="#This.Name#" type="error"  
            text="Message: #Arguments.Exception.message#"> 
    <cflog file="#This.Name#" type="error"  
        text="Root Cause Message: #Arguments.Exception.rootcause.message#"> 
    <!--- Display an error message if there is a page context. ---> 
    <cfif NOT (Arguments.EventName IS "onSessionEnd") OR  
            (Arguments.EventName IS "onApplicationEnd")> 
        <cfoutput> 
            <h2>An unexpected error occurred.</h2> 
            <p>Please provide the following information to technical support:</p> 
            <p>Error Event: #Arguments.EventName#</p> 
            <p>Error details:<br> 
            <cfdump var=#Arguments.Exception#></p> 
        </cfoutput> 
    </cfif> 
</cffunction>
</cfcomponent>