<cfcomponent> 
<cfset This.name = "Consumo Combustible"> 
<cfset This.Sessionmanagement="True"> 
<cfset This.loginstorage="session"> 
 
<cffunction name="OnRequestStart"> 
 
   
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