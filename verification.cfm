<cfparam name="userRole" default="">

<cfif IsUserInAnyRole("admin")>
    <cfset userRole = "admin" />
<cfelseif IsUserInAnyRole("log")> 
    <cfset userRole = "Log" />
<cfelseif IsUserInAnyRole("Guest")>
    <cfset userRole = "guest" />
<cfelse>
	<cfset  userRole = #GetUserRoles()#>
</cfif>

<cfif GetAuthUser() neq "">
  <cfset userObj = createObject("component","library.user").init(odbc=request.ODBC)>
  <cfset qUser = userObj.getUser(id=url.email)>
  <cfset local.username = qUser.username>
  <cfset local.id = qUser.id>
</cfif>