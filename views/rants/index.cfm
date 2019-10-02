<cfoutput>
    <cfif prc.rants.isEmpty()>
        <h3>No rants yet</h3>
        <a href="#event.buildLink( "rants.new" )#">Start one now!</a>
    <cfelse>
        <a href="#event.buildLink( "rants.new" )#" class="btn btn-link">Start a new rant!</a>
        <cfloop array="#prc.rants#" item="rant">
            #renderView( "_partials/_rant", { rant = rant } )#
        </cfloop>
    </cfif>
</cfoutput>