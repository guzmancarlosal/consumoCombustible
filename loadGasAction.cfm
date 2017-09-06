<cftry>
<cfparam name="form.idUser" default="">
<cfparam name="form.idVehiculo" default="">
<cfparam name="form.idPrecio" default="">
<cfparam name="form.liters" default="">
<cfparam name="form.odometer" default="">
<cfparam name="form.comments" default="">
<cfparam name="form.fecha" default="">
<cfset vObj = createObject("component","library.load").init(odbc=request.ODBC)>

<cfset qaddGas = vObj.addLog(idUser=form.idUser, idVehiculo=form.idVehiculo, idPrecio=form.idPrecio, liters=form.liters, odometer=form.odometer,comments=form.comments, fecha=form.fecha)>
<cfcatch><Cfdump var="#cfcatch#"></cfcatch>
</cftry>