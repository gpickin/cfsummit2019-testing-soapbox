component extends="tests.resources.BaseIntegrationSpec" {\

    function run() {

        describe( "Login", function() {
            it( "allows a user to see the Login page", function() {
                cfhttp( url="http://#cgi.http_host#/login", method="get", result="result" );
                expect( result.statuscode ).toBe( '200 Ok', 'Status code of the Login page was not 200' );
                expect( result.fileContent ).toBeString();
                expect( len( result.fileContent ) ).toBeGTE( 100 );
                expect( result.filecontent ).toMatch( '<h4 class="card-header">Log In</h4>', 'Log In Header did not appear on Login Page' );
                expect( result.filecontent ).notToMatch( '<button type="submit" class="btn btn-link nav-link">Log
                    Out</button>', 'Log Out Button should not appear on Login Page' );
                expect( result.filecontent).toMatch( '<input id="username" name="username" type="text" class="form-control" placeholder="Username" />' );
                expect( result.filecontent).toMatch( '<input id="password" name="password" type="password" class="form-control" placeholder="Password" />' );

            });
            it( "redirects the user back to the login page on a bad login", function() {
                cfhttp( url="http://#cgi.http_host#/login", method="post", result="result", redirect="false"){
                    cfhttpparam(name="username", type="formfield", value="test2222");
                    cfhttpparam(name="password", type="formfield", value="test2");
                }
                //debug( result );
                expect( result.statuscode ).toBe( '302 Found', 'A bad login should return a 302 redirect to the login page' );
                expect( result.responseHeader.location ).toBe( '/login?error=true' );
            });
            it( "allows a user to login to the site", function() {
                cfhttp( url="http://#cgi.http_host#/login", method="post", result="result", redirect="false"){
                    cfhttpparam(name="username", type="formfield", value="test2");
                    cfhttpparam(name="password", type="formfield", value="test2");
                }
                //debug( result );
                expect( result.statuscode ).toBe( '302 Found', 'A successful login should return a 302 redirect to the home page' );
                expect( result.responseHeader.location ).toBe( '/' );
            });
        });
    }
}