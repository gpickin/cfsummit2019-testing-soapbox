component {

    property name="userService"		inject="UserService";
    property name="auth"            inject="authenticationService@cbauth";

    function new( event, rc, prc ) {
        return event.setView( "registration/new" );
    }

    // create / save User
    function create( event, rc, prc ) {
        var user = populateModel( getInstance( "User" ) );
        userService.create( user );
        auth.login( user ); 
        relocate( uri = "/" );
    }

}