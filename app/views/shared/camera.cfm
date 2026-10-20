<cfoutput>
<div class="main">

	<!-- Header section start -->
	<section class="module-small-2 bg-dark py-5 text-white" style="background-image:url(/images/landing-page-3.jpg); background-size: cover; background-position: center;">
		<div class="container py-3">
			<div class="row justify-content-center">
				<div class="col-12 text-center">
					<h1 class="module-title font-playfair display-4 text-white text-shadow my-4">The Gardens</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- Header section end -->

	<!-- Breadcrumbs start (Bootstrap 5) -->
	<nav aria-label="Breadcrumb" class="container py-3">
		<ol class="breadcrumb font-alt mb-0">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item"><a href="/thegardens">The Gardens</a></li>
			<li class="breadcrumb-item active" aria-current="page">Live Camera</li>
		</ol>
	</nav>
	<!-- Breadcrumbs end -->

	<!-- Content section start -->
	<section class="module-2 pt-0 pb-5">
		<div class="container">
			<div class="row g-4">

				<!-- Left Subnav Column -->
				<aside class="col-lg-4 sidebar" aria-label="Section Navigation">
					<ul class="list-group sidebar-nav-v1 font-raleway shadow-sm" id="sidebar-nav">
						<li class="list-group-item"><a href="/thegardens/page/the-history-of-ohme-gardens">The History of Ohme Gardens</a></li>
						<li class="list-group-item"><a href="/thegardens/page/about-us">About Us</a></li>
						<li class="list-group-item"><a href="/thegardens/photo-gallery">Photo Gallery</a></li>
						<li class="list-group-item"><a href="/thegardens/page/map-of-the-gardens">Map of the Gardens</a></li>
						<li class="list-group-item active" aria-current="page"><a href="/thegardens/camera">Live Camera</a></li>
					</ul>
				</aside>

				<!-- Live Cam Content Column -->
				<div class="col-lg-8">
					<article class="post">
						<h2 class="post-title font-playfair fs-2 text-dark mb-3">Ohme Gardens Live Camera</h2>
						<div class="post-entry">
							<p class="d-flex align-items-center gap-2 mb-3">
								<span class="badge bg-success d-inline-flex align-items-center gap-1 px-3 py-2 fs-6">
									<img src="/images/green-dot.png" alt="" style="width: 12px; height: 12px;" aria-hidden="true">
									Live Streaming Online
								</span>
							</p>

							<div class="card border-0 shadow-sm overflow-hidden mb-3">
								<a href="/images/camera/camera.jpg" id="live-preview-full" title="Ohme Gardens - Live Camera Preview (Click to expand)" aria-label="Expand Ohme Gardens live camera view">
									<img src="/images/camera/camera.jpg" alt="Ohme Gardens real-time live webcam view" id="live-preview" class="img-fluid w-100">
								</a>
							</div>

							<p class="text-secondary small fst-italic">Camera automatically refreshes periodically. Select the image to view the high-resolution capture.</p>
						</div>
					</article>
				</div>

			</div>
		</div>
	</section>
</div>
</cfoutput>
