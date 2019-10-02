<cfoutput>
    <div class="card mb-3">
        <div class="card-header">
            <strong><a href="#event.buildLink( "users.#args.rant.getUser().getUsername()#" )#">#args.rant.getUser().getUsername()#</a></strong>
            said at #dateTimeFormat( args.rant.getCreatedDate(), "h:nn:ss tt" )#
            on #dateFormat( args.rant.getCreatedDate(), "mmm d, yyyy")#
        </div>
        <div class="panel card-body">
            #args.rant.getBody()#
        </div>
        <div class="card-footer">
            <cfif auth().guest()>
                <button disabled class="btn btn-outline-dark">
                    #arrayLen( args.rant.getBumps() )# 👊
                </button>
            <cfelseif auth().user().hasBumped( args.rant )>
                <form method="POST" action="#event.buildLink( "rants.#args.rant.getId()#.bumps" )#" style="display: inline;">
                    <input type="hidden" name="_method" value="DELETE" />
                    <button class="btn btn-dark">
                        #arrayLen( args.rant.getBumps() )# 👊
                    </button>
                </form>
            <cfelse>
                <form method="POST" action="#event.buildLink( "rants.#args.rant.getId()#.bumps" )#" style="display: inline;">
                    <button class="btn btn-outline-dark">
                        #arrayLen( args.rant.getBumps() )# 👊
                    </button>
                </form>
            </cfif>
        
            <cfif auth().guest()>
                <button disabled class="btn btn-outline-dark">
                    #arrayLen( args.rant.getPoops() )# 💩
                </button>
            <cfelseif auth().user().hasPooped( args.rant )>
                <form method="POST" action="#event.buildLink( "rants.#args.rant.getId()#.poops" )#" style="display: inline;">
                    <input type="hidden" name="_method" value="DELETE" />
                    <button class="btn btn-dark">
                        #arrayLen( args.rant.getPoops() )# 💩
                    </button>
                </form>
            <cfelse>
                <form method="POST" action="#event.buildLink( "rants.#args.rant.getId()#.poops" )#" style="display: inline;">
                    <button class="btn btn-outline-dark">
                        #arrayLen( args.rant.getPoops() )# 💩
                    </button>
                </form>
            </cfif>
        </div>
    </div>
</cfoutput>