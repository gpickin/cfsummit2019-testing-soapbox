component {

    property name="messagebox" inject="MessageBox@cbmessagebox";
    property name="auth" inject="authenticationService@cbauth";

    // new / login form page
    function new( event, rc, prc ) {
        return event.setView( "sessions/new" );
    }

    // create / doLogin actLogin
    function create( event, rc, prc ) {
        try {
            auth.authenticate( rc.username, rc.password )
            return relocate( uri = "/" );
        }
        catch ( InvalidCredentials e ) {
            messagebox.setMessage( type = "warn", message = e.message );
            return relocate( uri = "/login?error=true" );
        }
    }

    // delete / logout
    function delete( event, rc, prc ) {
        auth.logout();
        return relocate( uri = "/" );
    }

}