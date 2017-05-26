<cfspreadsheet action="read"
src="vehicle.xls"
query="myQuery">

<cfquery name="qGetBrand" dbtype="query">
	select distinct col_1 from myQuery 
</cfquery>
<cfloop query="#qGetBrand#">
	<cfquery name="qInsBrand" datasource="cc_consumo">
		nsert into company (name)
		values ('#qGetBrand.col_1#')
	</cfquery>
</cfloop>

