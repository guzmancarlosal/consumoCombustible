<cfset qGetMyVehicle = request.userobj.getMyVehicle(request.user.qUser.id)>
<cfprocessingdirective pageencoding = "utf-8"/>
<cfoutput>
<html>
	<link href="css/justified-nav.css" rel="stylesheet">
	<div class="jumbotron" id="formDiv">
	<cfif qGetMyVehicle.recordcount>
		<a class="btn btn-lg btn-danger btn-block" href="index.cfm?email=#url.email#" role="button" id="startBtn">Regresar</a>
		<table id="output" class="table">
			<thead>
			<tr>
				<td><b>Marca<br>Modelo (Año)</b></td>
				<td><b>Rendimiento Ciudad/</b><br><b> Carretera<br>(km/l)</b></td>
				<td><b>Rendimiento Combinado<br>Ajustado<br>(km/l)</b></td>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<script>
			var thisoutput = #serializeJSON(qGetMyVehicle)#;
			 $(document).ready(function() {
			 	jQuery.each(thisoutput.DATA, function(i,data) {
		            $("##output").append("<tr><td>" + data[0] + " " + data[1] + "  (" + data[8] + ")</td><td>" + data[3] + "/<br>" + data[4] + "</td><td>" + data[5] + "/<br>" + data[6] + "</td></tr>");
		        });
			 });
		</script>
	<cfelse>

		<h3>No tienes Vehiculos asignados</h3><br>
	
	</cfif>
	<a class="btn btn-lg btn-success" href="lookupCars.cfm?email=#url.email#" role="button" id="startBtn">Agregar Carros</a>
	<a class="btn btn-lg btn-danger" href="index.cfm?email=#url.email#" role="button" id="startBtn">Regresar</a>
	</div>
</html>
</cfoutput>