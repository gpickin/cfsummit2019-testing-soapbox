component accessors="true" {

    property name="rantService" inject="id";
    property name="reactionService" inject="id";

    property name="id";
    property name="username";
    property name="email";
    property name="password";

    function getRants() {
        return rantService.getForUserId( getId() );
    }

    function hasBumped( rant ) {
        if ( isNull( variables.bumps ) ) {
            variables.bumps = reactionService.getBumpsForUser( this );
        }
        return ! variables.bumps.filter( function( bump ) {
            return bump.getRantId() == rant.getId();
        } ).isEmpty();
    }
    
    function hasPooped( rant ) {
        if ( isNull( variables.poops ) ) {
            variables.poops = reactionService.getPoopsForUser( this );
        }
        return ! variables.poops.filter( function( poop ) {
            return poop.getRantId() == rant.getId();
        } ).isEmpty();
    }
}