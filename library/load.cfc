<cfcomponent hint="Add/Edit/Delete load information" output="false">

    <cfset this.odbc = "">
    
    <!--- ************************************************************************************************************************************************************** --->

    <cffunction name="init" access="public" output="true">
    	<cfargument name="odbc" type="string" required="yes">
        <cfset this.odbc = arguments.odbc>
        <cfreturn this />
    </cffunction>
    

    <cffunction access="public" name="addLog" output="false" returntype="boolean">
    	<cfargument name="idUser" type="string" required="yes">
    	<cfargument name="idVehiculo" type="string" required="yes">
    	<cfargument name="idPrecio" type="string" required="no" default="0">
        <cfargument name="liters" type="string" required="no" default="">
        <cfargument name="odometer" type="string" required="no" default="">
        <cfargument name="comments" type="string" required="no" default="">
        <cfargument name="fecha" type="date" required="no" default="#now()#">

		<cfquery name="qAddUser" datasource="#this.odbc#">
            Insert into [load] (idUser, idVehiculo, idPrecio, liters, odometer,fecha, comments)
            values (<cfqueryparam value = "#arguments.idUser#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value = "#arguments.idVehiculo#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value = "#arguments.idPrecio#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value = "#arguments.liters#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value = "#arguments.odometer#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value = "#arguments.fecha#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value = "#arguments.comments#" cfsqltype="cf_sql_varchar">);
        </cfquery>
        <cfreturn true />
    </cffunction>
    <cffunction access="public" name="getLoad" output="false" returntype="query">
        <cfargument name="idUser" type="string" required="yes">
        <cfargument name="idVehiculo" type="string" required="no" default="">
        <cfquery name="qGetUser" datasource="#this.odbc#">
            Select idload, idPRecio, liters, odometer, fecha         
            from [load] with (nolock)
            where iduser=<cfqueryparam value = "#arguments.idUser#" cfsqltype="cf_sql_varchar">
                <cfif arguments.idVehiculo neq "">
                    and idVehiculo =<cfqueryparam value = "#arguments.idVehiculo#" cfsqltype="cf_sql_varchar">
                </cfif>
                
        </cfquery>
        <cfreturn qGetUser />
    </cffunction>
    <cffunction access="public" name="getMonthSpent" output="false" returntype="query">
        <cfargument name="idUser" type="string" required="yes">
        <cfargument name="fecha" type="date" required="no" default="#now()#">
        <cfargument name="idVehiculo" type="string" required="no" default="">
        <cfquery name="qGetUser" datasource="#this.odbc#">
            With Months 
            AS
            (

                select 'Enero' as Month, 1 AS ID
                UNION
                select 'Febrero' as Month, 2 AS ID
                UNION
                select 'Marzo' as Month, 3 AS ID
                UNION
                select 'Abril' as Month, 4 AS ID
                UNION
                select 'Mayo' as Month, 5 AS ID
                UNION
                select 'Junio' as Month, 6 AS ID
                UNION
                select 'Julio' as Month, 7 AS ID
                UNION
                select 'Agosto' as Month, 8 AS ID
                UNION
                select 'Septiembre' as Month, 9 AS ID
                UNION
                select 'Octubre' as Month, 10 AS ID
                UNION
                select 'Noviembre' as Month, 11 AS ID
                UNION
                select 'Diciembre' as Month, 12 AS ID

            )

            SELECT  Months.Month as mes, COALESCE( sum(idPrecio) ,0 ) as precio
            FROM  Months  with (nolock) 
            Left JOIN [load] on month(fecha) = Months.id and iduser=<cfqueryparam value = "#arguments.idUser#" cfsqltype="cf_sql_varchar"> 
                <cfif arguments.idVehiculo neq "">
                    and idVehiculo =<cfqueryparam value = "#arguments.idVehiculo#" cfsqltype="cf_sql_varchar">
                </cfif>
            group by  Months.Month  
        </cfquery>
        <cfreturn qGetUser />
    </cffunction>
    <cffunction access="public" name="getStatics" output="false" returntype="any">
        <cfargument name="idUser" type="string" required="yes">
        <cfargument name="fecha" type="date" required="no" default="#now()#">
        <cfargument name="time" type="string" required="no" default="">
        <cfset local.stcStatics={}>
        <cfquery name="qGetTotal" datasource="#this.odbc#">
           select sum(liters) as liters, sum(idPrecio) as price
            from [load] 
            where idUser='#arguments.idUser#'
        </cfquery>
        <cfset local.stcStatics ["totalLiters"] = qGetTotal.liters>
        <cfset local.stcStatics ["totalPrice"] = qGetTotal.price>
        <cfquery name="qGetYTD" datasource="#this.odbc#">
           select sum(liters) as liters, sum(idPrecio) as price
            from [load] 
            where idUser='#arguments.idUser#'
                and year(fecha) ='#year(now())#'
        </cfquery>
        <cfset local.stcStatics ["YTDLiters"] = qGetTotal.liters>
        <cfset local.stcStatics ["YTDPrice"] = qGetTotal.price>
        <cfquery name="qGetMonth" datasource="#this.odbc#">
            select sum(liters) as liters, sum(idPrecio) as price
            from [load] 
            where idUser='#arguments.idUser#'
                and month(fecha) ='#month(now())#'
        </cfquery>
        <cfset local.stcStatics ["monthLiters"] = qGetTotal.liters>
        <cfset local.stcStatics ["monthPrice"] = qGetTotal.price>
        <cfquery name="qGetPrecPromMonth" datasource="#this.odbc#">
            select sum(idPrecio) as price,count(idLoad) as number
            from [load] 
            where idUser='#arguments.idUser#'
                and month(fecha) ='#month(now())#'
        </cfquery>
        
        <cfif qGetPrecPromMonth.number neq 0>
             <cfset local.stcStatics ["montProm"] = qGetPrecPromMonth.price/qGetPrecPromMonth.number>
        <cfelse>
            <cfset local.stcStatics ["montProm"] = 0>
        </cfif>

        <cfquery name="qGetPrecPromYTD" datasource="#this.odbc#">
            select sum(idPrecio) as price,count(idLoad) as number
            from [load] 
            where idUser='#arguments.idUser#'
                and year(fecha) ='#year(now())#'
        </cfquery>
        <cfif qGetPrecPromYTD.number neq 0>
            <cfset local.stcStatics ["YTDprom"] = qGetPrecPromYTD.price/qGetPrecPromYTD.number>
        <cfelse>
            <cfset local.stcStatics ["YTDprom"] = 0>
        </cfif>
        
        <cfquery name="qGetPrecPromTotal" datasource="#this.odbc#">
            select sum(idPrecio) as price,count(idLoad) as number
            from [load] 
            where idUser='#arguments.idUser#'
        </cfquery>
        <cfif qGetPrecPromTotal.number neq 0>
            <cfset local.stcStatics ["Totalprom"] = qGetPrecPromTotal.price/qGetPrecPromTotal.number>
        <cfelse>
            <cfset local.stcStatics ["Totalprom"] = 0>
        </cfif>
        
        <cfreturn local.stcStatics />
    </cffunction>
    
</cfcomponent>
