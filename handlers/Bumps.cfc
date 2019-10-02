component {

    property name="reactionService" inject="id";

    function create( event, rc, prc ) {
        reactionService.bump( rc.id, auth().getUserId() );
        relocate( "rants" );
    }

    function delete( event, rc, prc ) {
        reactionService.unbump( rc.id, auth().getUserId() );
        relocate( "rants" );
    }

}