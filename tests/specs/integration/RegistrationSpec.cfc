component extends="tests.resources.BaseIntegrationSpec" {

    property name="query" inject="provider:QueryBuilder@qb";

    function run() {
        describe( "registration", function() {
            it( "can register a user", function() {
                var initialQuery = queryExecute( "select * from users", {}, { returntype = "array" } );
                expect( initialQuery ).toBeQuery();
                expect( initialQuery.recordCount ).toBeGTE( 0 );
            
                // var event = post( "/registration", {
                //     "username" = "elpete"p,
                //     "email" = "eric@elpete.com",
                //     "password" = "mypass1234",
                //     "passwordConfirmation" = "mypass1234"
                // } );
            
                // expect( event.getValue( "relocate_URI", "" ) ).toBe( "/" );
            
                // var users = query.from( "users" ).get();
                // expect( users ).toBeArray();
                // expect( users.length ).toBeGTE( 1 );
                //expect( users[ 1 ].username ).toBe( "elpete" );
            } );
        } );
    }

}