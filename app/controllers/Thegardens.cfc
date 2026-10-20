component extends="GardenSection" {

	function config() {
		super.config();
		variables.sectionSlug = "thegardens";
	}

	function photoGallery() {
		currentSection = "thegardens";
		currentSlug = "photo-gallery";
		galleryType = "garden";
		galleryTitle = "Ohme Gardens Photo Gallery";
		pageTitle = galleryTitle & " | Ohme Gardens";
		metaDesc = "View breathtaking photographs of Ohme Gardens alpine landscapes, stone paths, and pools.";
		metaKeywords = "ohme gardens photos, photo gallery, garden";

		local.imgDiskDir = ExpandPath("/images/garden/full");
		galleryImages = [];
		if (DirectoryExists(local.imgDiskDir)) {
			local.files = DirectoryList(local.imgDiskDir, false, "name", "*.jpg|*.jpeg|*.png");
			ArraySort(local.files, "textnocase", "asc");
			for (local.f in local.files) {
				ArrayAppend(galleryImages, {
					thumb: "/images/garden/thumb/" & local.f,
					full: "/images/garden/full/" & local.f,
					caption: "Ohme Gardens - " & ListFirst(local.f, ".")
				});
			}
		}

		if (!fileExists(ExpandPath("/app/views/thegardens/photogallery.cfm"))) {
			renderView(template="/shared/gallery");
		}
	}

	function camera() {
		currentSection = "thegardens";
		currentSlug = "camera";
		pageTitle = "Live Camera | Ohme Gardens";
		metaDesc = "Live webcam stream overlooking the Columbia River and Wenatchee Valley from Ohme Gardens.";
		metaKeywords = "ohme gardens webcam, live camera, wenatchee live cam";

		if (!fileExists(ExpandPath("/app/views/thegardens/camera.cfm"))) {
			renderView(template="/shared/camera");
		}
	}

}
