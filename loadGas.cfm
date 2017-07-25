<cftry>

<cfparam name="request.ODBC" default="cc_consumo">
<cfset vObj = createObject("component","library.vehicles").init(odbc=request.ODBC)>
<cfset qGetMyVeh = vObj.getMyVeh(userID=request.user.qUser.id)>


<cfset qgetLastLog =vObj.getLastLog(userID=request.user.qUser.id)>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.font.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
<script>
	$(document).ready(function(){
		$('.datepicker').datepicker({
		    format: 'd/M/yyyy',
		     language: 'es'
		});
		$("#sbmBtn").click(function(){ 
			var error_free=true;
			$("[required]").each(function(index) {
				if ($(this).val()=='' || $(this).val()== null ) {
					var input=$(this);
					input.css('background-color' , '#ffdddd');
					$(this).removeClass("valid").addClass("invalid");
					var error_element=$(input).siblings('span')
					error_element.removeClass("errorForm").addClass("error_show"); 
					error_free=false;
					 $("#notSavedYet").show();
				}
			});
			if (error_free){				
        		submitForm();		
			}
		});	

		function submitForm() {
			$("#notSavedYet").hide();
				$("#submitButton").prop('disabled', true);
				$.ajax({
				  type: 'POST',
				  <cfoutput>url: 'loadGasAction.cfm?email=#url.email#',</cfoutput>
				   data:  { 
	                	idUser : $('#idUser').val(), 
	                	idVehiculo: $('#vehicle').val(), 
	                	idPrecio : $('#costo').val(), 
	                	liters : $('#litros').val(), 
	                	odometer : $('#odometer').val(),
	                	comments : $('#comments').val(),
	                	fecha : $('#day').val()
	               },
				  success:  function(){				
							 $("#myModal").modal();
						}
				});
		}	
		$("textarea[required], input[required]").keyup(function(event) {
			var input=$(this);
			var message=$(this).val();
			error_element=$("span", input.parent());

			if(message) {
				input.css('background-color' , '#FFFFFF');
				input.removeClass("invalid").addClass("valid");
				error_element.removeClass("error_show").addClass("errorForm");
			}else { 
				input.css('background-color' , '#ffdddd');
				input.removeClass("valid").addClass("invalid");
				error_element.removeClass("errorForm").addClass("error_show"); 
			}	
		});	
		$("select[required]").change(function(index) {
			var input=$(this);
			var isType=input.val();
			var error_element=$(input).siblings('span');
			if(isType != ""){ 
				input.css('background-color' , '#FFFFFF');
				input.removeClass("invalid").addClass("valid");
				error_element.removeClass("error_show").addClass("errorForm");
			}else{
				input.css('background-color' , '#ffdddd');
				input.removeClass("valid").addClass("invalid");
				error_element.removeClass("errorForm").addClass("error_show"); 
			}
		});

	    $('#backBtn').click(function(){
	    	<cfoutput>$(location).attr('href', 'index.cfm?email=#url.email#');</cfoutput>
	    });
	     $('#closeBtn, #closeBtn2').click(function(){
	    	location.reload();
	    });
		<!---function validateForm() {
			if(!$('#Fecha').val()) {
				alert('El campo FECHA es requerido');
				$('#Fecha').focus(function() {
	  				
				});
				return false;	
			}
			if(!$('#vehicle').val()) {
				alert('Selecciona tu VEHICULO');
				$('#vehicle').focus(function() {
	  				
				});
				return false;	
			}
			if(!$('#costo').val()) {
				alert('Debes de introducir el COSTO');
				$('#costo').focus(function() {
	  				
				});
				return false;	
			}
			if(!$('#odometer').val()) {
				alert('Debes de introducir el ODOMETRO');
				$('#odometer').focus(function() {
	  				
				});
				return false;	
			}
			if(!$('#litros').val()) {
				alert('Debes de introducir el NUMERO DE LITROS');
				$('#litros').focus(function() {
	  				
				});
				return false;	
			}
			    return true;
		}--->
	});

	
</script>
<style>
	.error_show{
		color: red;
		margin-left: 5px;
	}
	.errorForm{
		display: none;
	}
	input.invalid, textarea.invalid, select.invalid {
		 background-color:#ffdddd;
	}
	input.valid, textarea.valid, select.valid {
		background:#FFFFFF;
	}
</style>
<cfoutput>
	<div class="container">
		<form name="addLog" id="addLog" class="form-horizontal">
			<h2 class="text-center"><i class="fa fa-plus" aria-hidden="true"></i> Cargar Gasolina</h2>
			<div class="form-group form-group-lg" id="dateDiv2">
				<input  class="datepicker form-control" data-date-format="mm/dd/yyyy" placeholder="Fecha" id="day" required value="#dateformat(now(),'dd/mmm/yyyy')# #TimeFormat(now(), "hh:mm:sstt")#">
				<span class="errorForm" >Fecha es requerida</span>
			</div>
			<div class="form-group form-group-lg">
				<select class="form-control input-lg" id="vehicle" placeholder="Vehículo" required>
					<option value="" selected disabled>Vehículo</option>
					<cfloop query="qGetMyVeh">
						<option value="#qGetMyVeh.id#"> #qGetMyVeh.company# #qGetMyVeh.submarca# #qGetMyVeh.version# (#qGetMyVeh.modelo#)
					</cfloop>
				</select>
				<span class="errorForm">Vehículo es requerido</span>
			</div>
			<div class="form-group form-group-lg">
				<input class="form-control input-lg" id="odometer" placeholder="Odómetro"  type="number" min="0" step="1" required/>
				<span class="errorForm" >Valor de Odómetro es requerido</span>
				<input type="hidden" id="idUser" name="idUser" value="#request.user.qUser.id#">
			</div>
			<div class="form-group form-group-lg">
				<input class="form-control input-lg" id="costo" placeholder="Costo Total"  type="number" min="0" step="1" required/>
				<span class="errorForm" >Costo total es requerido</span>
			</div>
			<div class="form-group form-group-lg">
				<input class="form-control input-lg" id="litros" placeholder="Litros"  type="number" min="0" step="1" required />
				<span class="errorForm">Litros es requerido</span>
			</div>
			<div class="form-group form-group-lg ">
				<textarea class="form-control input-lg" placeholder="Comentarios" id="comments" required></textarea>
				<span class="errorForm">Commentarios es requerido</span>
			</div>
			<div class="form-group form-group-lg text-center">
				<button class="btn btn-success btn-lg" id="sbmBtn">Submit</button>	
				<button class="btn btn-danger btn-lg" id="backBtn">
					Regresar
				</button>
				
			</div>
			<cfif qgetLastLog.recordcount>
				<div class="alert alert-danger text-center" role="alert">
					Última Carga en <b>#dateformat(qgetLastLog.fecha)#</b> a las <b>#TimeFormat(qgetLastLog.fecha, "hh:mm:sstt")#</b><br>

				</div>
			</cfif>
		</form>
		</div>
		<!-- Modal content-->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true" id="closeBtn2">×</button>
					Alerta
				</div>
				<div class="modal-body">
					<p>La información ha sido guardado exitosamente.</p>
				</div>

				<div class="modal-footer ">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="closeBtn">Cerrar</button>
				</div>
			</div>

		</div>
	</div>
</cfoutput>
	<cfcatch><cfdump var="#cfcatch#"></cfcatch>
</cftry>