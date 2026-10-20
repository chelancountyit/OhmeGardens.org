component extends="wheels.Controller" {

	function config() {
		protectsFromForgery(except="submit");
		filters(through="loadSiteAndNav");
	}

	private void function loadSiteAndNav() {
		if (!StructKeyExists(variables, "site")) {
			site = getWorkspace("ohme-gardens");
		}
		if (!StructKeyExists(variables, "nav")) {
			nav = getNavigation("ohme-gardens", "top");
		}
	}

	private string function capitalizeSection(required string sec) {
		switch (LCase(arguments.sec)) {
			case "thegardens": return "The Gardens";
			case "planyourvisit": return "Plan Your Visit";
			case "events": return "Events";
			case "planyourspecialevent": return "Plan Your Special Event";
			case "getinvolved": return "Get Involved";
			case "contacts": return "Contacts";
			case "legal": return "Legal";
			default: return REReplace(arguments.sec, "(^[a-z]|\-[a-z])", "\U\1", "all");
		}
	}

}
