component extends="coldbox.system.testing.BaseTestCase" {

    property name="migrationService" inject="MigrationService@cfmigrations";

    this.loadColdBox = true;
    this.unloadColdBox = false;

    function beforeAll() {
        super.beforeAll();
        application.wirebox.autowire( this );
        // if ( ! request.keyExists( "migrationsRan" ) ) {
        //     migrationService.setMigrationsDirectory( "/root/resources/database/migrations" );
	    //     migrationService.setDefaultGrammar( "MySQLGrammar" );
        //     migrationService.setDatasource( "soapbox" );
        //     migrationService.runAllMigrations( "down" );
        //     migrationService.runAllMigrations( "up" );
        //     request.migrationsRan = true;
        // }
    }


    /**
     * @aroundEach
     */
    function wrapInTransaction( spec ) {
        transaction action="begin" {
            try {
                spec.body();
            }
            catch ( any e ) {
                rethrow;
            }
            finally {
                transaction action="rollback";
            }
        }
    }

}