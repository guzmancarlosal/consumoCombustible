<cfset qGetMyVehicle = request.userobj.getMyVehicle(request.user.qUser.id)>
<cfprocessingdirective pageencoding = "utf-8"/>
<cfoutput>
<html>
	<link href="css/justified-nav.css" rel="stylesheet">
	<div class="jumbotron" id="formDiv">
		<div class="row">
            
			<cfif qGetMyVehicle.recordcount>
				<div class="col-sm-12 text-center">
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
				</div>
			<cfelse>
			<div class="col-sm-12 text-center">
				<h3>No tienes Vehiculos asignados</h3><br>
			</div>
			
			</cfif>
			<div class="col-sm-6 text-center">
			<a class="btn btn-lg btn-success btn-block" href="lookupCars.cfm?email=#url.email#" role="button" id="startBtn">Agregar Carros</a>
			</div>
			<div class="col-sm-6 text-center">
			<a class="btn btn-lg btn-danger btn-block" href="index.cfm?email=#url.email#" role="button" id="startBtn">Regresar</a>
			</div>
		</div>
	</div>
</html>
</cfoutput>