<cfoutput>
<cfset pageTitle = "Page Not Found | Ohme Gardens">
<cfset bannerBg = "/images/landing-page-3.jpg">

<div class="main">

	<!-- Header section start -->
	<section class="module-small-2 bg-dark py-5 text-white" style="background-image:url(#bannerBg#); background-size: cover; background-position: center;">
		<div class="container py-3">
			<div class="row justify-content-center">
				<div class="col-12 text-center">
					<h1 class="module-title font-playfair display-4 text-white text-shadow my-4">Page Not Found</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- Header section end -->

	<!-- Breadcrumbs start (Bootstrap 5) -->
	<nav aria-label="Breadcrumb" class="container py-3">
		<ol class="breadcrumb font-alt mb-0">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">404 Not Found</li>
		</ol>
	</nav>
	<!-- Breadcrumbs end -->

	<!-- Content section start -->
	<section class="module-2 pt-0 pb-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 text-center py-5">
					<div class="mb-4">
						<span class="display-1 fw-bold text-success" style="color: ##2D5A27 !important;">404</span>
					</div>
					<h2 class="font-playfair fs-2 mb-3" style="color: ##1b4317;">The page you are looking for cannot be found</h2>
					<p class="lead font-raleway text-muted mb-4">
						The link you clicked may be outdated or mistyped, or the page may have been moved.
					</p>

					<div class="d-flex flex-wrap justify-content-center gap-3 mb-5">
						<a href="/" class="btn btn-success rounded-pill px-4 py-2 fw-bold" style="background-color: ##2D5A27; border-color: ##2D5A27;">Return to Home</a>
						<a href="/contacts" class="btn btn-outline-success rounded-pill px-4 py-2 fw-bold">Contact Us</a>
					</div>

					<div class="card border-0 shadow-sm rounded-4 text-start p-4" style="background-color: ##f7faf5; border: 1px solid ##d5dfcc !important;">
						<h3 class="fs-5 fw-bold mb-3 font-playfair" style="color: ##1b4317;">Popular Sections</h3>
						<div class="row g-3 font-raleway">
							<div class="col-md-6">
								<ul class="list-unstyled mb-0">
									<li class="mb-2"><a href="/thegardens" class="text-decoration-none fw-semibold" style="color: ##1e6b18;">&bull; The Gardens</a></li>
									<li class="mb-2"><a href="/thegardens/page/the-history-of-ohme-gardens" class="text-decoration-none" style="color: ##1e6b18;">&bull; History of Ohme Gardens</a></li>
									<li class="mb-2"><a href="/thegardens/photo-gallery" class="text-decoration-none" style="color: ##1e6b18;">&bull; Photo Gallery</a></li>
									<li class="mb-2"><a href="/thegardens/camera" class="text-decoration-none" style="color: ##1e6b18;">&bull; Live Camera</a></li>
								</ul>
							</div>
							<div class="col-md-6">
								<ul class="list-unstyled mb-0">
									<li class="mb-2"><a href="/planyourvisit/page/hours-and-admission" class="text-decoration-none fw-semibold" style="color: ##1e6b18;">&bull; Hours &amp; Admissions</a></li>
									<li class="mb-2"><a href="/events" class="text-decoration-none" style="color: ##1e6b18;">&bull; Upcoming Events</a></li>
									<li class="mb-2"><a href="/planyourspecialevent/page/weddings" class="text-decoration-none" style="color: ##1e6b18;">&bull; Weddings &amp; Private Events</a></li>
									<li class="mb-2"><a href="/getinvolved/page/donate" class="text-decoration-none" style="color: ##1e6b18;">&bull; Donate</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>
</cfoutput>

