component {

    property name="RantService" inject="id";

    function index( event, rc, prc ) {
        prc.rants = rantService.getAll();
        event.setView( "rants/index" );
    }

    function new( event, rc, prc ) {
        event.setView( "rants/new" );
    }

    function create( event, rc, prc ) {
        rc.userId = auth().getUserId();
        var rant = populateModel( getInstance( "Rant" ) );
        rantService.save( rant );
        relocate( "rants" );
    }

}