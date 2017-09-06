<cftry>
    
<cfset vObj = createObject("component","library.load").init(odbc=request.ODBC)>
<cfset veObj = createObject("component","library.vehicles").init(odbc=request.ODBC)>
<cfset qGetMyVeh = veObj.getMyVeh(userID=request.user.qUser.id)>



<cfprocessingdirective pageencoding = "utf-8">
<div class="jumbotron" id="formDiv">
<cfif qGetMyVeh.recordcount>
    <cfset qGetMySpent = vObj.getStatics(request.user.qUser.id)>
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
                                <td><cfif structKeyExists(qGetMySpent, "monthLiters")>#qGetMySpent["monthLiters"]#</cfif></td>
                                <td><cfif structKeyExists(qGetMySpent, "YTDLiters")>#qGetMySpent["YTDLiters"]#</cfif></td>
                                <td><cfif structKeyExists(qGetMySpent, "totalLiters")>#qGetMySpent["totalLiters"]#</cfif></td>
                            </tr>

                            <tr>
                                <td>Costo de Combustible</td>
                                <td><cfif structKeyExists(qGetMySpent, "monthPrice")>#qGetMySpent["monthPrice"]#</cfif></td>
                                <td><cfif structKeyExists(qGetMySpent, "YTDPrice")>#qGetMySpent["YTDPrice"]#</cfif></td>
                                <td><cfif structKeyExists(qGetMySpent, "totalPrice")>#qGetMySpent["totalPrice"]#</cfif></td>
                            </tr>
                            <tr>
                                <td>Precio Promedio</td>
                                <td><cfif structKeyExists(qGetMySpent, "montProm")>#qGetMySpent["montProm"]#</cfif></td>
                                <td><cfif structKeyExists(qGetMySpent, "YTDprom")>#qGetMySpent["YTDprom"]#</cfif></td>
                                <td><cfif structKeyExists(qGetMySpent, "Totalprom")>#qGetMySpent["Totalprom"]#</cfif></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
           </div>
        </div>
    </cfoutput>

    
<cfelse>
    <h3>No tienes Vehiculos asignados</h3><br>
</cfif>
    <cfoutput>
        <div class="row">
            <div class="col-sm-12 text-center">
                <a class="btn btn-lg btn-success" href="lookupCars.cfm?email=#url.email#" role="button" id="startBtn">Agregar Carros</a>
                <a class="btn btn-lg btn-danger" href="index.cfm?email=#url.email#" role="button" id="startBtn">Regresar</a>
            </div>
        </div>
        
    </cfoutput>
   </div>
<cfcatch><cfdump var="#cfcatch#"></cfcatch>
</cftry>