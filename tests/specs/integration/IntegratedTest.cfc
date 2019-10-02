component extends="Integrated.BaseSpecs.ColdBoxBaseSpec" {
    function beforeAll() {
        // Make sure to call the parent class's beforeAll() and afterAll() methods.
        super.beforeAll();
    }

    function afterAll() {
        super.afterAll();
    }

    this.useDatabaseTransactions = true;

    function run() {
        describe( "Registration", function() {
            it( "allows a new user to register for the site", function() {
                this.visitEvent('registration.new')
                    .seeTitleIs( 'Soapbox' )
                    .see('Register for SoapBox')
                    .type('MyTestUser@ortussolutions.com', 'email')
                    .type('MyTestUser', 'username')
                    .type("Yay Test Box is Really Cool, especially when it's Integrated", 'password');
            });
        });

        describe( "Login", function() {
            it( "allows a user to login to the site", function() {
                this.visit('/login')
                    .seeTitleIs( 'Soapbox' )
                    .seeInElement('Log In','nav')
                    .dontSeeInElement('Start a new Rant','nav')
                    .dontSee('Log Out')
                    .type('test2', 'username')
                    .type("test2", 'password')
                    .press('Log In')
                    .seeInElement('Start a Rant','nav')
                    .seeTitleIs('SoapBox')
                    .see('Start a new rant!')
                    .see('Start a new RANT!', false);
            });
            it( "will not allow the User to view the Add Rant form if they are not logged in", function() {
                this.visit('/rants/new')
                    .seePageIs( "/login" )
                    .seeInElement('Log In','nav')
                    .dontSee('Log Out')
                    .click( "Start a Rant" )
                    .seePageIs( "/login" )
            });
            it( "allows the user to login and start a new rant", function() {
                this.visit('/login')
                    .debugPage()
                    .seeInElement('Log In','nav')
                    .dontSee('Log Out')
                    .click( "Start a Rant" )
                    .seePageIs( "/login" )
                    .type('test2', 'username')
                    .type("test2", 'password')
                    .press('Log In')
                    .seeInElement('Start a Rant','nav')
                    .seeTitleIs('SoapBox')
                    .see('Start a new rant!')
                    .see('Start a new RANT!', false)
                    .click( "Start a Rant" )
                    .debugPage()
                    .seePageIs( "/rants/new" );
            });
        });
    }
}