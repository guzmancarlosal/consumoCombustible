<cftry>
	
<cfset vObj = createObject("component","library.load").init(odbc=request.ODBC)>
<cfset qGetMySpent = vObj.getMonthSpent(request.user.qUser.id)>
<cfprocessingdirective pageencoding = "utf-8">
<div class="jumbotron" id="formDiv">
	<cfif qGetMySpent.recordcount>
		<cfset veObj = createObject("component","library.vehicles").init(odbc=request.ODBC)>
		<cfset qGetMyVeh = veObj.getMyVeh(userID=request.user.qUser.id)>
		<cfoutput>
		    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		    <script type="text/javascript">
		        google.charts.load('current', {'packages':['bar']});
		        var data = #serializeJSON(qGetMySpent)#
		        google.charts.setOnLoadCallback(function(){ drawChart(data) });
		        function drawChart(myDatas) {
		        	var datas = new google.visualization.arrayToDataTable([myDatas.COLUMNS,myDatas.DATA[0],myDatas.DATA[1],myDatas.DATA[2],myDatas.DATA[3],myDatas.DATA[4],myDatas.DATA[5],myDatas.DATA[6],myDatas.DATA[7],myDatas.DATA[8],myDatas.DATA[9],myDatas.DATA[10],myDatas.DATA[11]]);
					var materialOptions = {
					        chart: {
					          title: 'Gasto Mensual de Combustible'

					        },
					        hAxis: {
					          title: 'Gasto Total',
					          minValue: 0,
					        },
					        vAxis: {
					          title: 'Mes',
					          gridlines: { count: 1 } 
					        },
					        bars: 'horizontal',
                     		'height':500
					};
		        	var chart = new google.charts.Bar(document.getElementById('curve_chart'));
        			chart.draw(datas,materialOptions);
		        }
		        $(document).ready(function() {
			        $('##vehicle').change(function(e){
			             $.ajax({
			                type: "POST",
			                url: 'dataJSON.cfm?mode=getSpend&vehicleID='+$("##vehicle").val(),
			                data: {userid:#request.user.qUser.id#},
			                success: function(json) {
			        			google.charts.setOnLoadCallback(function(){ drawChart(json) });
					        }
					    });
			        });
		        } );
		    </script>
		    <div class="row">
		        <div class="col-sm-12 text-center">
		            <h2><i class="fa fa-cog" aria-hidden="true"></i> Gasto Mensual</h2>
		        </div>
		    </div>
		    <div class="row">
		        <div class="col-sm-12 text-center">
		            <select class="form-control input-lg" id="vehicle" placeholder="Vehículo" required>
		                <option value="">Todos los Vehículos
		               	<cfloop query="qGetMyVeh">
							<option value="#qGetMyVeh.id#"> #qGetMyVeh.company# #qGetMyVeh.submarca# #qGetMyVeh.version# (#qGetMyVeh.modelo#)
						</cfloop>
		              </select>
		              <br><br>
		        </div>
		    </div>
		    <div class="row">
		    <br>
		      <div class="col-sm-12 text-center">
		          <div id="curve_chart" ></div><br>
		       </div>
		    </div>
		</cfoutput>
	<cfelse>
		<h3>No tienes Cargas de gasolina</h3>Añade gasolina a tu vehiculo y regístralo para generar estadísticas<br>
	</cfif>
	<div class="row">
        <div class="col-sm-12 text-center">
           <cfoutput><a class="btn btn-lg btn-danger" href="index.cfm?email=#url.email#" role="button" id="startBtn">Regresar</a></cfoutput>
        </div>
	</div>
</div>
<cfcatch><cfdump var="#cfcatch#"></cfcatch>
</cftry>