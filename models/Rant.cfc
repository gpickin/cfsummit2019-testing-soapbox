component accessors="true" {

    property name="userService" inject="id";
    property name="reactionService" inject="id";

    property name="id";
    property name="body";
    property name="createdDate";
    property name="modifiedDate";
    property name="userId";

    function getUser() {
        return UserService.retrieveUserById( getUserId() );
    }

    function getBumps() {
        return reactionService.getBumpsForRant( this );
    }
    
    function getPoops() {
        return reactionService.getPoopsForRant( this );
    }

}