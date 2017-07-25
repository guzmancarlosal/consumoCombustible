<cftry>
    
<cfset vObj = createObject("component","library.load").init(odbc=request.ODBC)>
<cfset qGetMySpent = vObj.getStatics(request.user.qUser.id)>
<cfdump var="#qGetMySpent#">
<cfprocessingdirective pageencoding = "utf-8">
<div class="jumbotron" id="formDiv">
    <cfif qGetMySpent.recordcount>
        <cfset veObj = createObject("component","library.vehicles").init(odbc=request.ODBC)>
        <cfset qGetMyVeh = veObj.getMyVeh(userID=request.user.qUser.id)>
        <cfoutput>
           <div class="row">
                <div class="col-sm-12 text-center">
                    <h2><i class="fa fa-area-chart" aria-hidden="true"></i> Estádisticas de Rendimiento</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 text-center">
                   <div class="card-block">
                        <table id="tableReport" class="table table-bordered table-hover table-striped no-more-tables">
                            <thead>
                                <tr class="bg-active">
                                    <th>Concepto</th>
                                    <th>#month(now())#/#year(now())#</th>
                                    <th>#year(now())#</th>
                                    <th>Todo</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Consumo Total de Combustible(Litros)</td>
                                </tr>
                                <tr>
                                    <td>Costo de Combustible</td>
                                </tr>
                                <tr>
                                    <td>Distancia Conducida</td>
                                    
                                </tr>
                                <tr>
                                    <td>Precio Promedio</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
               </div>
            </div>
        </cfoutput>
    <cfelse>
        <h3>Datos insuficientes</h3>Añade gasolina a tu vehiculo y regístralo para generar estadísticas<br>
    </cfif>
    <div class="row">
        <div class="col-sm-12 text-center">
           <cfoutput><a class="btn btn-lg btn-danger" href="index.cfm?email=#url.email#" role="button" id="startBtn">Regresar</a></cfoutput>
        </div>
    </div>
</div>
<cfcatch><cfdump var="#cfcatch#"></cfcatch>
</cftry>