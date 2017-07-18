<cfprocessingdirective pageencoding = "utf-8"/>
<div class="row"  id='OptnRow1'>
    <div class="col-sm-12 text-center">
        <p><a class="btn btn-lg btn-Danger btn-block" href="loadGas.cfm" role="button" id="startBtn"><i class="fa fa-cog" aria-hidden="true"></i> Cargar Gasolina</a></p>
    </div>
   
</div>
<div class="row" id='OptnRow'>
    <div class="col-sm-6 text-center">
        <p><a class="btn btn-lg btn-success btn-block" href="myCars.cfm?email=#url.email#" role="button" id="startBtn"><i class="fa fa-cog" aria-hidden="true"></i> Mis Autos</a></p>
    </div>
    <div class="col-sm-6 text-center">
        <p><a class="btn btn-lg btn-success btn-block" href="graphics.cfm?email=#url.email#" role="button" id="startBtn"><i class="fa fa-area-chart" aria-hidden="true"></i> Gráficos</a></p>
    </div>
     <div class="col-sm-6 text-center">
        <p><a class="btn btn-lg btn-success btn-block" href="Statics.cfm?email=#url.email#" role="button" id="startBtn"><i class="fa fa-area-chart" aria-hidden="true"></i> Estadísticas</a></p>
    </div>
    <div class="col-sm-6 text-center">
        <p><a class="btn btn-lg btn-success btn-block" onclick="$('#OptnRow').hide();$('#OptnRow1').hide();" href="#" role="button" id="startBtn"><i class="fa fa-area-chart" aria-hidden="true"></i>Comparar Autos</a></p>
    </div>
    
</div>