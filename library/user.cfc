<cfcomponent hint="Add/Edit/Delete user information" output="false">

    <cfset this.odbc = "">
    
    <!--- ************************************************************************************************************************************************************** --->

    <cffunction name="init" access="public" output="true">
    	<cfargument name="odbc" type="string" required="yes">
        <cfset this.odbc = arguments.odbc>
        <cfreturn this />
    </cffunction>
    

    <cffunction access="public" name="addUser" output="false" returntype="boolean">
    	<cfargument name="username" type="string" required="yes">
    	<cfargument name="type" type="string" required="yes">
    	<cfargument name="status" type="string" required="no" default="0">
        <cfargument name="email" type="string" required="no" default="">

    		<cfquery name="qAddUser" datasource="#this.odbc#">
                Insert into [user] (username, type, status, email, password)
                values (<cfqueryparam value = "#arguments.username#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value = "#arguments.type#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value = "#arguments.status#" cfsqltype="cf_sql_varchar">,
                        <cfqueryparam value = "#arguments.email#" cfsqltype="cf_sql_varchar">,'1234');
            </cfquery>
        <cfreturn true />
    </cffunction>
    <cffunction access="public" name="getUser" output="false" returntype="query">
        <cfargument name="id" type="string" required="yes">
        <cfquery name="qGetUser" datasource="#this.odbc#">
            Select top 1 * 
            from [user] with (nolock)
            where email=<cfqueryparam value = "#arguments.id#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn qGetUser />
    </cffunction>
    <cffunction access="public" name="getAllUsers" output="false" returntype="query">
        <cfargument name="userRole" type="string" required="no">
        <cfquery name="qGetOrg" datasource="#this.odbc#">
            Select * 
            from [user] with (nolock)
            where type <> 4
        </cfquery>
        <cfreturn qGetOrg />
    </cffunction>
    <cffunction  access="public" name="setFavorite" output="false" returntype="boolean">
        <cfargument name="idUser" type="string" required="true">
        <cfargument name="idVehicle" type="string" required="true">         
        <cfquery name="qInserFav" datasource="#this.odbc#">
            Insert Into user_vehiculo (idUser, idVehiculo)
            values(<cfqueryparam value="#arguments.idUser#"  cfsqltype="cf_sql_varchar">,<cfqueryparam value="#arguments.idVehicle#" cfsqltype="cf_sql_varchar">)
        </cfquery>
        <cfreturn true/>
    </cffunction>
    <cffunction  access="public" name="getFav" output="false" returntype="query">
        <cfargument name="idUser" type="string" required="true">    
        <cfquery name="qGetData" datasource="#this.odbc#">
            Select distinct * from user_vehiculo uv
            where uv.idUser=<cfqueryparam value="#arguments.idUser#"  cfsqltype="cf_sql_varchar">;
        </cfquery>
        <cfreturn qGetData/>
    </cffunction>
    <cffunction  access="public" name="removeFav" output="false" returntype="boolean">
        <cfargument name="idUser" type="string" required="true">
        <cfargument name="idVehicle" type="string" required="true">         
        <cfquery name="qInserFav" datasource="#this.odbc#">
            Delete From user_vehiculo 
            where idUser=<cfqueryparam value="#arguments.idUser#"  cfsqltype="cf_sql_varchar"> and idVehiculo=<cfqueryparam value="#arguments.idVehicle#" cfsqltype="cf_sql_varchar">
        </cfquery>
        <cfreturn true/>
    </cffunction>
    <cffunction  access="public" name="getMyVehicle" output="false" returntype="query">
        <cfargument name="idUser" type="string" required="true">    
        <cfquery name="qGetData" datasource="#this.odbc#">
            Select distinct company, submarca, version, rciudad, rcarr, rcomb, rajust, cilindros, modelo,id 
            FROM user_vehiculo uv
                INNER JOIN vehiculo on uv.idvehiculo=vehiculo.id
            where uv.idUser=<cfqueryparam value="#arguments.idUser#"  cfsqltype="cf_sql_varchar">;
        </cfquery>
        <cfreturn qGetData/>
    </cffunction>
</cfcomponent>
