<cfparam name="url.mode" default="">
<cfparam name="request.ODBC" default="cc_consumo">
<cfparam name="variables.responseJson" default="">
<cfset local.responseJson=[]>
<cfprocessingdirective pageEncoding="utf-8">
<cfheader charset="utf-8" name="Content-Type" value="application/json">
<cftry>
	

<cfcontent reset="yes">
<cfset lObj = createObject("component","library.vehicles").init(odbc=request.ODBC)>
<cfif url.mode eq "getModel">
	<cfparam name="url.company" default="">
	<cfif url.company neq "">
		<cfset getModelos =lObj.getModelo(company=url.company)>
		<cfloop query="#getModelos#">
			<cfset arrayAppend(local.responseJson, {'name':getModelos.submarca} )>
		</cfloop>
	</cfif>
<cfelseif url.mode eq "getVersion">
	<cfparam name="url.company" default="">
	<cfif url.company neq "">
		<cfset getModelos =lObj.getVersion(company=url.company, ano=url.ano, modelo=url.modelo)>
		<cfloop query="#getModelos#">
			<cfset arrayAppend(local.responseJson, {'name':getModelos.version} )>
		</cfloop>
	</cfif>
<cfelseif url.mode eq "getAno">
	<cfparam name="url.company" default="">
	<cfif url.company neq "">
		<cfset getModelos =lObj.getAno(company=url.company,modelo=url.modelo)>
		<cfloop query="#getModelos#">
			<cfset arrayAppend(local.responseJson, {'name':getModelos.modelo} )>
		</cfloop>
	</cfif>
<cfelseif url.mode eq "getSpend">
	<cfparam name="url.vehicleID" default="">
	<cfparam name="form.userid" default="">
	<cfset loadObj = createObject("component","library.load").init(odbc=request.ODBC)>
	<cfset local.responseJson = loadObj.getMonthSpent(idUser=form.userid,idVehiculo=url.vehicleID)>
</cfif>
<cfoutput>#serializeJSON(local.responseJson)#</cfoutput>
<cfcatch><cfdump var="#cfcatch#"></cfcatch>
</cftry>
