component {

    property name="populator" inject="wirebox:populator";
    property name="wirebox" inject="wirebox";
    property name="q" inject="queryHelper";

    function getBumpsForRant( rant ) {
        return q.QueryToStruct( queryExecute(
            "SELECT * FROM `bumps` WHERE `rantId` = ?",
            [ rant.getId() ],
            { returntype = "array" }
        ) ).map( function( bump ) {
            return populator.populateFromStruct(
                wirebox.getInstance( "Bump" ),
                bump
            )
        } );
    }

    function getPoopsForRant( rant ) {
        return q.QueryToStruct( queryExecute(
            "SELECT * FROM `poops` WHERE `rantId` = ?",
            [ rant.getId() ],
            { returntype = "array" }
        ) ).map( function( bump ) {
            return populator.populateFromStruct(
                wirebox.getInstance( "Poop" ),
                bump
            )
        } );
    }

    function getBumpsForUser( user ) {
        return q.QueryToStruct( queryExecute(
            "SELECT * FROM `bumps` WHERE `userId` = ?",
            [ user.getId() ],
            { returntype = "array" }
        ) ).map( function( bump ) {
            return populator.populateFromStruct(
                wirebox.getInstance( "Bump" ),
                bump
            )
        } );
    }
    
    function getPoopsForUser( user ) {
        return q.QueryToStruct( queryExecute(
            "SELECT * FROM `poops` WHERE `userId` = ?",
            [ user.getId() ],
            { returntype = "array" }
        ) ).map( function( poop ) {
            return populator.populateFromStruct(
                wirebox.getInstance( "Poop" ),
                poop
            )
        } );
    }

    function bump( rantId, userId ) {
        queryExecute(
            "INSERT INTO `bumps` VALUES (?, ?)",
            [ userId, rantId ]
        );
    }
    
    function unbump( rantId, userId ) {
        queryExecute(
            "DELETE FROM `bumps` WHERE `userId` = ? AND `rantId` = ?",
            [ userId, rantId ]
        );
    }
    
    function poop( rantId, userId ) {
        queryExecute(
            "INSERT INTO `poops` VALUES (?, ?)",
            [ userId, rantId ]
        );
    }
    
    function unpoop( rantId, userId ) {
        queryExecute(
            "DELETE FROM `poops` WHERE `userId` = ? AND `rantId` = ?",
            [ userId, rantId ]
        );
    }
}