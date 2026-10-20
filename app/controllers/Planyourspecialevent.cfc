component extends="GardenSection" {

	function config() {
		super.config();
		variables.sectionSlug = "planyourspecialevent";
	}

	function photoGallery() {
		currentSection = "planyourspecialevent";
		currentSlug = "photo-gallery";
		galleryType = "weddings";
		galleryTitle = "Weddings & Private Events Photo Gallery";
		pageTitle = galleryTitle & " | Ohme Gardens";
		metaDesc = "View breathtaking photographs of weddings and private events at Ohme Gardens.";
		metaKeywords = "ohme gardens wedding photos, wedding gallery";

		local.imgDiskDir = ExpandPath("/images/weddings/full");
		galleryImages = [];
		if (DirectoryExists(local.imgDiskDir)) {
			local.files = DirectoryList(local.imgDiskDir, false, "name", "*.jpg|*.jpeg|*.png");
			ArraySort(local.files, "textnocase", "asc");
			for (local.f in local.files) {
				ArrayAppend(galleryImages, {
					thumb: "/images/weddings/thumb/" & local.f,
					full: "/images/weddings/full/" & local.f,
					caption: "Weddings at Ohme Gardens - " & ListFirst(local.f, ".")
				});
			}
		}

		if (!fileExists(ExpandPath("/app/views/planyourspecialevent/photogallery.cfm"))) {
			renderView(template="/shared/gallery");
		}
	}

	function faq() {
		currentSection = "planyourspecialevent";
		currentSlug = "frequently-asked-questions";
		pageTitle = "Frequently Asked Questions | Ohme Gardens";
		metaDesc = "Frequently asked questions about weddings, photography sessions, and private events at Ohme Gardens.";
		metaKeywords = "ohme gardens faq, wedding faq, photography policy";

		content = model("Page").findOne(
			where="SiteID IN ('ohme-gardens', 'site-ohme-gardens') AND Permalink = 'frequently-asked-questions' AND StatusCode = 'Active' AND isPublished = 1 AND DeletedAt IS NULL"
		);

		if (!fileExists(ExpandPath("/app/views/planyourspecialevent/faq.cfm"))) {
			renderView(template="/shared/faq");
		}
	}

}
