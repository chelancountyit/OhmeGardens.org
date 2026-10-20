<cfscript>
	mapper()
		// Root
		.root(to="home##index", method="get")

		// Healthcheck / warmup
		.get(name="up", to="up##index")

		// Specific pages
		.get(name="contacts", pattern="/contacts", to="contacts##index")
		.post(name="submitContact", pattern="/contacts/submit", to="contacts##submit")
		.get(name="legal", pattern="/legal", to="legal##index")

		// Specific actions with clean friendly URLs
		.get(name="gardenGallery", pattern="/thegardens/photo-gallery", to="thegardens##photoGallery")
		.get(name="gardenCamera", pattern="/thegardens/camera", to="thegardens##camera")
		.get(name="weddingGallery", pattern="/planyourspecialevent/photo-gallery", to="planyourspecialevent##photoGallery")
		.get(name="weddingFaq", pattern="/planyourspecialevent/frequently-asked-questions", to="planyourspecialevent##faq")

		// Standard CFWheels MVC convention: /[controller]/page/[key]
		.get(name="sectionPage", pattern="/[controller]/page/[key]", action="page")
		.get(name="sectionPages", pattern="/[controller]/pages/[key]", action="page")

		// Standard CFWheels MVC convention: /[controller] -> index
		.get(name="sectionIndex", pattern="/[controller]", action="index")

		// Native CFWheels wildcard
		.wildcard()
	.end();
</cfscript>
