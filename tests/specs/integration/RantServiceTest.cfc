component extends="tests.resources.BaseIntegrationSpec" {

    function run() {
        describe( "Rant Service", function() {

            beforeEach(function( currentSpec ){
                service = getInstance( "RantService" );
            });

            it( "can be created", function(){
                expect( service ).toBeComponent();
            });
        });
    }

}
