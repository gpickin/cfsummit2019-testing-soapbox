component {

    property name="userService" inject="id";

    function show( event, rc, prc ) {
        prc.user = userService.retrieveUserByUsername( rc.username );
        if ( prc.user.getId() == "" ) {
            relocate( "404" );
        }
        event.setView( "users/show" );
    }

}