<cfparam name="form.mode" default="">
<cfparam name="form.userID" default="">
<cfparam name="form.vehID" default="">

<cfif form.mode eq "addFav">
	<cfset userObj = createObject("component","library.user").init(odbc=request.ODBC)>
	<cfif form.userID neq "" and form.vehID neq"">
		<cfset qInsertFav = userObj.setFavorite(idUser=form.userID, idVehicle=form.vehID)>
	</cfif>
</cfif>
<cfif form.mode eq "remFav">
	<cfset userObj = createObject("component","library.user").init(odbc=request.ODBC)>
	<cfif form.userID neq "" and form.vehID neq"">
		<cfset qInsertFav = userObj.removeFav(idUser=form.userID, idVehicle=form.vehID)>
	</cfif>
</cfif>