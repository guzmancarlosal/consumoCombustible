<cfparam name="request.ODBC" default="cc_consumo">
<cfset lObj = createObject("component","library.vehicles").init(odbc=request.ODBC)>
<cfset qgetAllVeh =lObj.getVeh()>
<cfoutput>
  <!DOCTYPE html>
  <html>
    <head>
      <cfprocessingdirective pageencoding = "utf-8">
      <title>Consumo Combustible</title>
      <link href="css/justified-nav.css" rel="stylesheet">
    </head>
    <body>
      <!-- Jumbotron -->
      <div class="jumbotron" id="formDiv">
        <h1>#application.applicationname#</h1>
        <p class="lead">Selecciona tu vehículo para consultar el consumo de combustible!</p>
        <form id="thisForm" method="post" action="consumoReport.cfm">   
          <select id="marca" name="marca" class="form-control">
              <option value="">Marca
              <cfloop query="#qgetAllVeh#">
                 <option value="#qgetAllVeh.company#">#qgetAllVeh.company#
              </cfloop>
          </select><br>        
          <select id="modelo" name="modelo" class="form-control" disabled>
              <option value="">Modelo
          </select><br>  
          <select id="ano" name="ano" class="form-control" disabled>
              <option value="">Año
              <cfloop from="2008" to="2018" index="i">
                  <option value="#i#">#i#
              </cfloop>
          </select><br>
          <select id="version" name="version" class="form-control" disabled>
              <option value="">Version
          </select><br>          
          <div id="buttondiv" style="display:none;">
          <button class="default-primary-color btn btn-lg btn-block" type="submit" style="color:white;"><i class="fa fa-search" aria-hidden="true"></i> Consultar</button>
          </form>           
          </div>
      </div>
      <footer class="footer">
        <p><a href="http://xikmaapps.com/">&copy; Xikma Apps</a> #year(now())#</p>
      </footer>
 
      <!--- IE10 viewport hack for Surface/desktop Windows 8 bug
      <script src="js/ie10-viewport-bug-workaround.js"></script>--->
      <script>
       $(document).ready(function(){
          $("##marca").change(function(){
            $('##buttondiv').hide();
            $("##modelo").prop('disabled', false);
            $("##ano,##version").prop('disabled', true);
            $.ajax({
                type: "POST",
                url: 'dataJSON.cfm?mode=getModel&company='+$("##marca").val(),
                dataType: 'json',
                success: function(json) {
                    var $el = $("##modelo");
                    $el.empty(); // remove old options
                    $("##modelo").empty();
                    $("##version").empty();
                     $("##version").append($("<option></option>")
                            .attr("value", '').text('Version'));
                    $el.append($("<option></option>")
                            .attr("value", '').text('Modelo'));
                    $.each(json, function(i, obj){
                       $('<option />',
                       {
                           value:obj.name,
                           text:obj.name
                       }
                        ).appendTo($el);
                   });                            
                }
            });
          });
          $("##modelo").change(function(){
            $('##buttondiv').show();
            $("##ano").prop('disabled', false);
            $("##version").prop('disabled', true);
             $.ajax({
                type: "POST",
                url: 'dataJSON.cfm?mode=getAno&company='+$("##marca").val()+'&modelo='+$("##modelo").val(),
                dataType: 'json',
                success: function(json) {
                    var $el = $("##ano");
                    $el.empty(); // remove old options
                    $el.append($("<option></option>")
                            .attr("value", '').text('Año'));

                    $.each(json, function(i, obj){
                        $('<option />',
                           {
                               value:obj.name,
                               text:obj.name
                           }
                        ).appendTo($el);
                   });                            
                }
            });
          });
          $("##ano").change(function(){
            $("##version").prop('disabled', false);
            $('##buttondiv').show();
            $.ajax({
                type: "POST",
                url: 'dataJSON.cfm?mode=getVersion&company='+$("##marca").val()+'&ano='+$("##ano").val()+'&modelo='+$("##modelo").val(),
                dataType: 'json',
                success: function(json) {
                    var $el = $("##version");
                    $el.empty(); // remove old options
                    $el.append($("<option></option>")
                            .attr("value", '').text('Version'));

                    $.each(json, function(i, obj){
                        $('<option />',
                           {
                               value:obj.name,
                               text:obj.name
                           }
                        ).appendTo($el);
                   });                            
                }
            });
          });
          $("##ano").change(function(){
            $('##buttondiv').show();
          });

           $('##buttondiv').click(function(e){
              $("##formDiv").hide();
              $("##table").hide();
           });
      });
      </script>
    </body>
  </html>
</cfoutput>