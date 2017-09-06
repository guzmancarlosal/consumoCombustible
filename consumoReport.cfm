<cfparam name="form.marca" default="">
<cfparam name="form.modelo" default="">
<cfparam name="form.ano" default="">
<cfparam name="form.version" default="">
<cfparam name="request.odbc" default="cc_consumo">
<cfparam name="local.userid" default="">
<cfparam name="request.user.qUser.id" default="">
<cfprocessingdirective pageencoding = "utf-8">


<cfset lObj = createObject("component","library.vehicles").init(odbc=request.ODBC)>
<cfset userObj = createObject("component","library.user").init(odbc=request.ODBC)>
<cfset getModelos =lObj.getVehidetaqil(company=form.marca, modelo=form.modelo, ano=form.ano, version=form.version)>
<cfset getFavoritos =userObj.getFav(idUser=request.user.qUser.id)>
<cfoutput>
<script>
	function saveBtn(userid, vehid,mode) {
		$.post( "action.cfm", { userid:userid, vehid: vehid,mode:mode })
		  .done(function( data ) {
		    window.location.href = "mycars.cfm?email=#url.email#";
		  });
	}

</script>
<html>
	<link href="css/justified-nav.css" rel="stylesheet">
<div class="jumbotron" id="formDiv">
	<cfif getModelos.recordcount gt 2>
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
			var thisoutput = #serializeJSON(getModelos)#;
			 $(document).ready(function() {
			 	jQuery.each(thisoutput.DATA, function(i,data) {
		            $("##output").append("<tr><td>" + data[0] + " " + data[1] + "  (" + data[8] + ")</td><td>" + data[3] + "/<br>" + data[4] + "</td><td>" + data[5] + "/<br>" + data[6] + "</td></tr>");
		        });
			 });
		</script>
	<cfelse>
		<cfquery name="qgetMinMax" datasource="#request.odbc#">
			select 	max(rciudad) as maxCiu, min (rciudad) as minCiu, 
					max(rcarr) as maxCarr, min(rcarr) as minCarr, 
					max(rcomb) maxComb, min(rcomb) as minComb 
			FROM vehiculo
		</cfquery>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	   	<script type="text/javascript">
	      google.charts.load('current', {'packages':['gauge']});
	      google.charts.setOnLoadCallback(drawChart);

	      function drawChart() {

	        var data = google.visualization.arrayToDataTable([
	          ['Label', 'Value'],
	          ['Ciudad', #getModelos.rciudad#],
	          ['Carretera', #getModelos.rcarr#],
	          ['Combinado',#getModelos.rcomb#]
	        ]);

	        var options = {
	          width: 300, height: 1000,
	          redFrom: 0, redTo: 12,
	          max:33,
	          yellowFrom:12, yellowTo: 15,
	          greenFrom:15, greenTo: 33
	        };

	        var chart = new google.visualization.Gauge(document.getElementById('chart_div'));

	        chart.draw(data,options);
	      }

	    </script>
	
  		<body  style="font-family: Arial;border: 0 none;">
		  	<h2>#form.marca# #form.modelo# (#form.ano#)</h2><br>
		  	<h5>#form.version#</h5>
		  	<cfif isdefined('request.user.qUser.id') and request.user.qUser.id neq "">
				<cfquery name="qGetVehiculo" dbtype="query">
					Select distinct * from getFavoritos where idvehiculo='#getmodelos.id#'
				</cfquery>
				<cfif qGetVehiculo.recordcount>
					<a class="btn btn-lg btn-danger btn-block" role="button" id="startBtn"   onclick="saveBtn('#request.user.qUser.id#','#getmodelos.id#','remFav');">
			  			<i class="fa fa-times" aria-hidden="true"></i> 
			  			Quitar de Favorito
			  		</a>
				<cfelse>
			  		<a class="btn btn-lg btn-success btn-block" role="button" id="startBtn" onclick="saveBtn('#request.user.qUser.id#','#getmodelos.id#','addFav');">
			  			<i class="fa fa-star-o" aria-hidden="true"></i> 
			  			Guardar <br> como Favoritos
			  		</a>
			  	</cfif>
		  	</cfif>
		  	<br>
		  	Rendimiento (litros/kilometro)<br>
		    <div id="chart_div" align="center"></div>
	</cfif>
	<a class="btn btn-lg btn-danger" href="index.cfm?email=#url.email#" role="button" id="startBtn">Regresar</a>
	</div>
</body>
</html>



</cfoutput>