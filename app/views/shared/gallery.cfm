<cfoutput>
<cfset sectionTitle = capitalizeSection(currentSection)>
<cfset bannerBg = (galleryType EQ "weddings") ? "/images/Plan-Your-Special-Event.jpg" : "/images/landing-page-3.jpg">

<div class="main">

	<!-- Header section start -->
	<section class="module-small-2 bg-dark py-5 text-white" style="background-image:url(#bannerBg#); background-size: cover; background-position: center;">
		<div class="container py-3">
			<div class="row justify-content-center">
				<div class="col-12 text-center">
					<h1 class="module-title font-playfair display-4 text-white text-shadow my-4">#EncodeForHTML(sectionTitle)#</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- Header section end -->

	<!-- Breadcrumbs start (Bootstrap 5) -->
	<nav aria-label="Breadcrumb" class="container py-3">
		<ol class="breadcrumb font-alt mb-0">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li><a href="/#currentSection#" class="breadcrumb-item">#EncodeForHTML(sectionTitle)#</a></li>
			<li class="breadcrumb-item active" aria-current="page">Photo Gallery</li>
		</ol>
	</nav>
	<!-- Breadcrumbs end -->

	<!-- Gallery section start -->
	<section class="module-2 pt-0 pb-5">
		<div class="container">
			<div class="row g-4">

				<!-- Left Subnav Column -->
				<aside class="col-lg-4 sidebar" aria-label="Section Navigation">
					<ul class="list-group sidebar-nav-v1 font-raleway shadow-sm" id="sidebar-nav">
						<cfif galleryType EQ "garden">
							<li class="list-group-item"><a href="/thegardens/page/the-history-of-ohme-gardens">The History of Ohme Gardens</a></li>
							<li class="list-group-item"><a href="/thegardens/page/about-us">About Us</a></li>
							<li class="list-group-item active" aria-current="page"><a href="/thegardens/photo-gallery">Photo Gallery</a></li>
							<li class="list-group-item"><a href="/thegardens/page/map-of-the-gardens">Map of the Gardens</a></li>
						<cfelse>
							<li class="list-group-item"><a href="/planyourspecialevent/page/why-ohme">Why Ohme</a></li>
							<li class="list-group-item"><a href="/planyourspecialevent/page/weddings">Weddings</a></li>
							<li class="list-group-item"><a href="https://ohmegardens.tripleseat.com/party_request/20439" target="_blank" rel="noopener noreferrer">Private Events</a></li>
							<li class="list-group-item"><a href="/planyourspecialevent/frequently-asked-questions">Frequently Asked Questions</a></li>
							<li class="list-group-item active" aria-current="page"><a href="/planyourspecialevent/photo-gallery">Photo Gallery</a></li>
						</cfif>
					</ul>
				</aside>

				<!-- Gallery Content Column -->
				<div class="col-lg-8">
					<article class="post">
						<h2 class="post-title font-playfair fs-2 text-dark mb-3">#EncodeForHTML(galleryTitle)#</h2>
						<div class="post-entry">
							<p class="text-secondary">Click on any photo to view in high resolution.</p>
							<hr class="my-3">

							<div class="row g-3 gallery-popup" id="gallery-grid">
								<cfloop array="#galleryImages#" index="local.img">
									<div class="col-6 col-sm-4">
										<div class="gallery-item gallery-bordered h-100 rounded overflow-hidden shadow-sm">
											<div class="gallery-image h-100">
												<a href="#local.img.full#" class="gallery-link d-block h-100 position-relative" title="#EncodeForHTMLAttribute(local.img.caption)#" aria-label="View photo: #EncodeForHTMLAttribute(local.img.caption)#">
													<img src="#local.img.thumb#" alt="#EncodeForHTMLAttribute(local.img.caption)#" class="img-fluid w-100" style="height: 180px; object-fit: cover;">
													<div class="gallery-caption">
														<div class="gallery-icon">
															<span class="icon-magnifying-glass" aria-hidden="true"></span>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div>
								</cfloop>
							</div>

						</div>
					</article>
				</div>

			</div>
		</div>
	</section>
</div>

<script>
	$(document).ready(function() {
		if ($.fn.magnificPopup) {
			$('##gallery-grid').magnificPopup({
				delegate: 'a.gallery-link',
				type: 'image',
				gallery: {
					enabled: true,
					navigateByImgClick: true,
					preload: [0,1]
				},
				image: {
					titleSrc: 'title'
				}
			});
		}
	});
</script>
</cfoutput>
