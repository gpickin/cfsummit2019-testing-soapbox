component {

    property name="populator" inject="wirebox:populator";
    property name="wirebox"   inject="wirebox";
    property name="q" inject="queryHelper";

    function getAll() {
        return q.QueryToStruct( queryExecute(
            "SELECT * FROM `rants` ORDER BY `createdDate` DESC"
        ) ).map( function ( rant ) {
            return populator.populateFromStruct(
                wirebox.getInstance( "Rant" ),
                rant
            );
        } );
    }

    function save( rant ) {
        rant.setModifiedDate( now() );
        queryExecute(
            "
                INSERT INTO `rants` (`body`, `modifiedDate`, `userId`)
                VALUES (?, ?, ?)
            ",
            [
                rant.getBody(),
                { value = rant.getModifiedDate(), cfsqltype = "CF_SQL_TIMESTAMP" },
                rant.getUserId()
            ],
            { result = "local.result" }
        );
        rant.setId( result.GENERATED_KEY );
        return rant;
    }

    function getForUserId( id ) {
        return q.QueryToStruct( queryExecute(
            "SELECT * FROM `rants` WHERE `userId` = ? ORDER BY `createdDate` DESC",
            [ id ],
            { returntype = "array" }
        ) ).map( function ( rant ) {
            return populator.populateFromStruct(
                wirebox.getInstance( "Rant" ),
                rant
            );
        } );
    }

}