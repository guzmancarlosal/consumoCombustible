<cftry>
<cfparam name="idUser" default="">
<cfparam name="idVehiculo" default="">
<cfparam name="idPrecio" default="">
<cfparam name="liters" default="">
<cfparam name="odometer" default="">
<cfparam name="comments" default="">
<cfparam name="fecha" default="">
<cfset vObj = createObject("component","library.load").init(odbc=request.ODBC)>

<cfset qaddGas = vObj.addLog(idUser=form.idUser, idVehiculo=form.idVehiculo, idPrecio=form.idPrecio, liters=form.liters, odometer=form.odometer,comments=form.comments, fecha=form.fecha)>
<cfcatch><Cfdump var="#cfcatch#"></cfcatch>
</cftry>