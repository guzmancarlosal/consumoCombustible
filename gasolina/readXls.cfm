
<!---<cfheader name="Content-Disposition" value="attachment; filename=PS_excelFile.xls">    
<cfcontent type="application/x-msexcel; charset=utf-16" reset="yes">--->
<cfset thislist ="">
<cfloop from="1" to="100000" index="i">
	<cfset thislist= listAppend(thislist, i, ",")>
</cfloop>

<cfhttp url="http://www.ecovehiculos.gob.mx/generalistaentabla.php?
" method="post">
 <cfhttpparam
        type="FORMFIELD"
        name="p"
        value="#thislist#"
        />
</cfhttp>



<cfoutput>#cfhttp.Filecontent#</cfoutput>
