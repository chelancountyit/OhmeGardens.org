component extends="Controller" {

	function index() {
		pageTitle = "Privacy Policy & Terms of Use | Ohme Gardens";
		metaDesc = "Privacy policy, disclaimers, accessibility statement, and terms of use for Ohme Gardens.";
		metaKeywords = "privacy policy, terms of use, ohme gardens";
		currentSection = "legal";
		currentSlug = "legal";

		if (!fileExists(ExpandPath("/app/views/legal/index.cfm"))) {
			renderView(template="/shared/legal");
		}
	}

}
