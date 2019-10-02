component{

	function configure(){
		setFullRewrites( true );
		resources("registration");
		addRoute( "rants/:id/bumps", "Bumps", { "POST" = "create", "DELETE" = "delete" } );
		addRoute( "rants/:id/poops", "Poops", { "POST" = "create", "DELETE" = "delete" } );
		resources( "rants" );
		addRoute( "/login", "sessions", { "POST" = "create", "GET" = "new" } );
		get( "/users/:username" ).to( "users.show" );
		delete( "/logout" ).to( "sessions.delete" );
		route( ":handler/:action?" ).end();
	}

}