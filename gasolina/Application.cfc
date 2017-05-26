<cfcomponent> 
<cfset This.name = "Consumo Combustible"> 
<cfset This.Sessionmanagement="True"> 
<cfset This.loginstorage="session"> 
 
<cffunction name="OnRequestStart"> 
 
   
</cffunction> 
<cffunction name="onError"> 
   <Cfdump var="#arguments#">
</cffunction>
</cfcomponent>