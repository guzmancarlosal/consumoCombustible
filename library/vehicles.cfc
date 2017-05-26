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
            where company='#arguments.company#'
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
            where company='#arguments.company#'
                and modelo = '#arguments.ano#' and submarca ='#arguments.modelo#'
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
            where company='#arguments.company#'
               and submarca ='#arguments.modelo#'
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
            select distinct company, submarca, version, rciudad, rcarr, rcomb, rajust, cilindros, modelo
            from [vehiculo] with (nolock)
            where 1=1 
                <cfif arguments.company neq "">
                    and company='#arguments.company#'
                </cfif>
                <cfif arguments.ano neq "">
                    and modelo='#arguments.ano#'
                </cfif>
                <cfif arguments.modelo neq "">
                    and submarca='#arguments.modelo#'
                </cfif>
                <cfif arguments.version neq "">
                    and version='#arguments.version#'
                </cfif>
            order by company, submarca
        </cfquery>
        <cfreturn qGetOrg />
    </cffunction>

</cfcomponent>
