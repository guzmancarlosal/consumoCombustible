<cfparam name="form.marca" default="">
<cfparam name="form.modelo" default="">
<cfparam name="form.ano" default="">
<cfparam name="form.version" default="">
<cfparam name="request.odbc" default="cc_consumo">
<cfprocessingdirective pageencoding = "utf-8">
<cfset lObj = createObject("component","library.vehicles").init(odbc=request.ODBC)>
<cfset getModelos =lObj.getVehidetaqil(company=form.marca, modelo=form.modelo, ano=form.ano, version=form.version)>

<a href="index.cfm"> Regresar</a>
	<table id="output">
		<tr>
			<td>Marca</td>
			<td>Modelo</td>
			<td>Año</td>
			<td>Version</td>
		</tr>
		<cfoutput query="getModelos">
			<tr>
				<td>#getModelos.company#</td>
				<td>#getModelos.submarca#</td>
				<td>#getModelos.modelo#</td>
				<td>#getModelos.Version#</td>
			</tr>
		</cfoutput>
	</table>
<a href="index.cfm"> Regresar</a>