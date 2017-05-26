<cfspreadsheet action="read"
src="vehicle.xls"
query="myQuery">

<cfloop query="myQuery">
	<cfif !isNumeric( myQuery.col_18 )>
		<cfset myQuery[ "col_18" ][ myQuery.currentRow ] = javaCast(
            "int",
            0
            ) />
    </cfif>
</cfloop>
<cfabort>
<cftransaction>
	

<cfloop query="#myQuery#">

	<cfquery name="qInsBrand" datasource="cc_consumo">
		insert into vehiculo([company]
      ,[submarca]
      ,[version]
      ,[modelo]
      ,[trans]
      ,[comb]
      ,[cilindros]
      ,[potencia]
      ,[tamano]
      ,[categoria]
      ,[rciudad]
      ,[rcarr]
      ,[rcomb]
      ,[rajust]
      ,[CO2]
      ,[NOx]
      ,[califEfGas]
      ,[califContAire])
		values ('#myQuery.col_1#','#myQuery.col_2#','#myQuery.col_3#','#myQuery.col_4#','#myQuery.col_5#','#myQuery.col_6#','#ReReplaceNoCase(myQuery.col_7,"[^0-9\.]","","ALL")#','#ReReplaceNoCase(myQuery.col_8,"[^0-9\.]","","ALL")#','#ReReplaceNoCase(myQuery.col_9,"[^0-9\.]","","ALL")#','#myQuery.col_10#','#myQuery.col_11#','#myQuery.col_12#','#myQuery.col_13#','#myQuery.col_14#','#myQuery.col_15#','#myQuery.col_16#','#myQuery.col_17#','#myQuery.col_18#')
	</cfquery>
</cfloop>
</cftransaction>
done

