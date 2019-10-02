component{

    property name="populator" inject="wirebox:populator";
    property name="wirebox" inject="wirebox";
    property name="bcrypt" inject="@BCrypt";
    property name="authenticationService" inject="AuthenticationService@cbauth";
    property name="q" inject="queryHelper";
    
    function list(){
        return q.QueryToStruct( queryExecute( "select * from users", {}, { returntype = "array" } ) );
    }

    function create( required user ){
        queryExecute(
            "
                INSERT INTO `users` (`email`, `username`, `password`)
                VALUES (?, ?, ?)
            ",
            [
                user.getEmail(),
                user.getUsername(),
                bcrypt.hashPassword( user.getPassword() )
            ],
            { result = "local.result" }
        );
        user.setId( result.GENERATED_KEY );
        return user;
    }

    function retrieveUserById( id ) {
        return populator.populateFromQuery(
            wirebox.getInstance( "User" ),
            queryExecute( "SELECT * FROM `users` WHERE `id` = ?", [ id ] ),
            1
        );
    }

    function retrieveUserByUsername( username ) {
        return populator.populateFromQuery(
            wirebox.getInstance( "User" ),
            queryExecute( "SELECT * FROM `users` WHERE `username` = ?", [ username ] ),
            1
        );
    }

    function isValidCredentials( username, password ) {
        var users = q.QueryToStruct( queryExecute( "SELECT * FROM `users` WHERE `username` = ?", [ username ], {
        returntype = "array" } ) );
        if ( users.isEmpty() ) {
            return false;
        }
        return bcrypt.checkPassword( password, users[ 1 ].password );
    }

    function userValidator( rule, controller ) {
        return authenticationService.isLoggedIn();
    }
}