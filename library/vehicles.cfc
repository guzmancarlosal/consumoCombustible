<cfcomponent hint="get Vehicles data" output="false">

    <cfset this.odbc = "">
    
    <!--- ************************************************************************************************************************************************************** --->

    <cffunction name="init" access="public" output="true">
    	<cfargument name="odbc" type="string" required="yes">
        <cfset this.odbc = arguments.odbc>
        <cfreturn this />
    </cffunction>
    <cffunction access="public" name="getVeh" output="false" returntype="query">
        <cfquery name="qGetOrg" datasource="#this.odbc#">
            Select distinct company 
            from [vehiculo] with (nolock)
            order by company
        </cfquery>
        <cfreturn qGetOrg />
    </cffunction>
    <cffunction access="public" name="getModelo" output="false" returntype="query">
        <cfargument name="company" type="string" required="yes">
        <cfquery name="qGetOrg" datasource="#this.odbc#">
            select distinct submarca
            from [vehiculo] with (nolock)
            where company=<cfqueryparam value="#arguments.company#"  cfsqltype="cf_sql_varchar">
            order by submarca
        </cfquery>
        <cfreturn qGetOrg />
    </cffunction>
    <cffunction access="public" name="getVersion" output="false" returntype="query">
        <cfargument name="company" type="string" required="yes">
        <cfargument name="ano" type="string" required="yes">
        <cfargument name="modelo" type="string" required="yes">
        <cfquery name="qGetOrg" datasource="#this.odbc#">
            select distinct version
            from [vehiculo] with (nolock)
            where company= <cfqueryparam value="#arguments.company#"  cfsqltype="cf_sql_varchar">
                and modelo = <cfqueryparam value="#arguments.ano#"  cfsqltype="cf_sql_varchar"> 
                and submarca = <cfqueryparam value="#arguments.modelo#"  cfsqltype="cf_sql_varchar">
            order by version
        </cfquery>
        <cfreturn qGetOrg />
    </cffunction>
    <cffunction access="public" name="getAno" output="false" returntype="query">
        <cfargument name="company" type="string" required="yes">
        <cfargument name="modelo" type="string" required="yes">
        <cfquery name="qGetOrg" datasource="#this.odbc#">
            select distinct modelo
            from [vehiculo] with (nolock)
            where company=<cfqueryparam value="#arguments.company#"  cfsqltype="cf_sql_varchar">
               and submarca =<cfqueryparam value="#arguments.modelo#"  cfsqltype="cf_sql_varchar">
            order by modelo
        </cfquery>
        <cfreturn qGetOrg />
    </cffunction>
    <cffunction access="public" name="getVehidetaqil" output="false" returntype="query">
        <cfargument name="company" type="string" required="no" default="">
        <cfargument name="ano" type="string" required="no"  default="">
        <cfargument name="modelo" type="string" required="no"  default="">
         <cfargument name="version" type="string" required="no"  default="">
        <cfquery name="qGetOrg" datasource="#this.odbc#">
            select distinct company, submarca, version, rciudad, rcarr, rcomb, rajust, cilindros, modelo,id
            from [vehiculo] with (nolock)
            where 1=1 
                <cfif arguments.company neq "">
                    and company=<cfqueryparam value="#arguments.company#"  cfsqltype="cf_sql_varchar">
                </cfif>
                <cfif arguments.ano neq "">
                    and modelo=<cfqueryparam value="#arguments.ano#"  cfsqltype="cf_sql_varchar">
                </cfif>
                <cfif arguments.modelo neq "">
                    and submarca=<cfqueryparam value="#arguments.modelo#"  cfsqltype="cf_sql_varchar">
                </cfif>
                <cfif arguments.version neq "">
                    and version=<cfqueryparam value="#arguments.version#"  cfsqltype="cf_sql_varchar">
                </cfif>
            order by company, submarca
        </cfquery>
        <cfreturn qGetOrg />
    </cffunction>
    <cffunction access="public" name="getMyVeh" output="false" returntype="query">
        <cfargument name="userID" type="string" required="yes" default="0">
        <cfquery name="qGetOrg" datasource="#this.odbc#">
            select distinct id, company, submarca, version, modelo
            from vehiculo
            inner join user_vehiculo with (nolock) ON user_vehiculo.idVehiculo=vehiculo.id
            where user_vehiculo.idUser=<cfqueryparam value="#arguments.userID#"  cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn qGetOrg />
    </cffunction>
    <cffunction access="public" name="getLastLog" output="false" returntype="query">
        <cfargument name="userID" type="string" required="yes" default="0">
         <cfargument name="idVehiculo" type="string" required="no" default="">
        <cfquery name="qGetOrg" datasource="#this.odbc#">
            select top 1 idLoad, fecha
            from [load]
            where [load].idUser='#arguments.userID#'
                <cfif arguments.idVehiculo neq "">
                    and idVehiculo=<cfqueryparam value="#arguments.idVehiculo#"  cfsqltype="cf_sql_varchar">
                </cfif>
            order by fecha desc
        </cfquery>
        <cfreturn qGetOrg />
    </cffunction>


</cfcomponent>
