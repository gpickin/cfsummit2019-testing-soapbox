<cfcomponent displayname="QueryHelper" output="false" hint="Helps convert Queries">

    <cffunction name="QueryToStruct" access="public" output="false" returntype="any" hint="">
        <cfargument name="queryObj" type="query" required="true" />

        <cfset var returnArray=arrayNew(1)>
            <cfset var rowStruct=structNew()>
                <cfset var colname="">

                    <cfloop query="arguments.queryObj">
                        <cfset rowStruct=structNew()>
                            <cfloop list="#arguments.queryObj.columnList#" index="colname">
                                <cfset "rowStruct.#colname#"=arguments.queryObj[colname][arguments.queryObj.currentRow]>
                            </cfloop>
                            <cfset arrayAppend(returnArray,rowStruct)>
                    </cfloop>

                    <cfreturn returnArray />
    </cffunction>

</cfcomponent>