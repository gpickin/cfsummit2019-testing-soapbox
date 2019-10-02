component extends="tests.resources.BaseIntegrationSpec" {

    function run() {
        
        describe( "User Service", function() {

            beforeEach(function( currentSpec ){
                service = prepareMock( getInstance( "UserService" ) );
            });

            it( "can be created", function(){
				expect( service ).toBeComponent();
			});

            it( "can list all users", function() {
                expect( service.list() ).toBeArray();
            } );
        } );
    }

}