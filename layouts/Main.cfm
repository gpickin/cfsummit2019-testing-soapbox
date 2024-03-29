<cfoutput>
	<!DOCTYPE html>
	<html lang="en">
		<head>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
			<title>SoapBox</title>
	
			<base href="#event.getHTMLBaseURL()#" />
	
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
			<link rel="stylesheet" href="/includes/css/app.css">
	
			<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
		</head>
		<body>
			<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top main-navbar">
				<a class="navbar-brand" href="#event.buildLink( url = "/" )#">
					<i class="fas fa-bullhorn mr-2"></i>
					SoapBox
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li><a href="#event.buildLink( "rants.new" )#" class="nav-link">Start a Rant</a></li>
					</ul>
					<ul class="navbar-nav ml-auto">
						<cfif auth().isLoggedIn()>
							<form method="POST" action="#event.buildLink( "logout" )#">
								<input type="hidden" name="_method" value="DELETE" />
								<button type="submit" class="btn btn-link nav-link">Log Out</button>
							</form>
						<cfelse>
							<a href="#event.buildLink( "registration.new" )#" class="nav-link">Register</a>
							<a href="#event.buildLink( "login" )#" class="nav-link">Log In</a>
						</cfif>
					</ul>
				</div>
			</nav>
	
			<main role="main" class="container">
				#getInstance( "MessageBox@cbmessagebox" ).renderIt()#
				#renderView()#
			</main>
	
			<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		</body>
	</html>
	</cfoutput>