<cfoutput>
<!-- Hero Carousel (Modern Bootstrap 5 + Alpine Garden Theme) -->
<section id="home" class="home-section hero-carousel-section" aria-label="Garden Highlights Carousel">
	<h1 class="visually-hidden">Ohme Gardens - Historic Alpine Oasis in Wenatchee, WA</h1>
	
	<div id="heroCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="7000" data-bs-pause="hover" data-bs-keyboard="true">
		
		<!-- Carousel Indicators (Accessible) -->
		<div class="carousel-indicators mb-4">
			<button type="button" data-bs-target="##heroCarousel" data-bs-slide-to="0" class="active rounded-pill" aria-current="true" aria-label="Slide 1: Seasonal Welcome"></button>
			<button type="button" data-bs-target="##heroCarousel" data-bs-slide-to="1" class="rounded-pill" aria-label="Slide 2: Wander Alpine Meadows"></button>
			<button type="button" data-bs-target="##heroCarousel" data-bs-slide-to="2" class="rounded-pill" aria-label="Slide 3: Blufftop Weddings"></button>
		</div>

		<!-- Carousel Slides -->
		<div class="carousel-inner">
			
			<!-- Slide 1: Welcome & Season Status -->
			<div class="carousel-item active">
				<div class="hero-slide-bg" style="background-image: url('/images/landing-page-5.jpg');">
					<div class="hero-overlay"></div>
					<div class="container h-100 d-flex flex-column justify-content-center align-items-center text-center position-relative py-5">
						<span class="badge bg-success bg-opacity-75 rounded-pill px-3 py-2 text-uppercase mb-3 fw-bold letter-spacing-1 shadow-sm">
							<i class="fa fa-tree me-1" aria-hidden="true"></i> Historic Alpine Oasis
						</span>
						<h2 class="display-3 font-playfair fw-bold text-white text-shadow mb-3 max-w-850">
							#EncodeForHTML(bannerText)#
						</h2>
						<p class="lead text-white text-shadow fs-4 mb-4 max-w-750 d-none d-sm-block">
							9 acres of tranquil stone pathways, cascading mountain pools, and sweeping views of the Columbia River.
						</p>
						<div class="d-flex flex-wrap justify-content-center gap-3">
							<a href="/planyourvisit" class="btn btn-success btn-lg rounded-pill px-4 py-3 fw-bold shadow-lg">
								Plan Your Visit &nbsp;<i class="fa fa-compass" aria-hidden="true"></i>
							</a>
							<a href="/thegardens/page/the-history-of-ohme-gardens" class="btn btn-outline-light btn-lg rounded-pill px-4 py-3 fw-bold shadow-lg">
								Discover Our Story &nbsp;<i class="fa fa-book" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Slide 2: The Alpine Trails -->
			<div class="carousel-item">
				<div class="hero-slide-bg" style="background-image: url('/images/landing-page-3.jpg');">
					<div class="hero-overlay"></div>
					<div class="container h-100 d-flex flex-column justify-content-center align-items-center text-center position-relative py-5">
						<span class="badge bg-success bg-opacity-75 rounded-pill px-3 py-2 text-uppercase mb-3 fw-bold letter-spacing-1 shadow-sm">
							<i class="fa fa-leaf me-1" aria-hidden="true"></i> Natural Stone Pathways
						</span>
						<h2 class="display-3 font-playfair fw-bold text-white text-shadow mb-3 max-w-850">
							Wander Alpine Meadows &amp; Evergreen Trails
						</h2>
						<p class="lead text-white text-shadow fs-4 mb-4 max-w-750 d-none d-sm-block">
							Hand-crafted stone stairs, towering cedars and firs, and lush mountain flora high above Wenatchee.
						</p>
						<div class="d-flex flex-wrap justify-content-center gap-3">
							<a href="/thegardens" class="btn btn-success btn-lg rounded-pill px-4 py-3 fw-bold shadow-lg">
								Explore The Gardens &nbsp;<i class="fa fa-map-signs" aria-hidden="true"></i>
							</a>
							<a href="/thegardens/photo-gallery" class="btn btn-outline-light btn-lg rounded-pill px-4 py-3 fw-bold shadow-lg">
								View Photo Gallery &nbsp;<i class="fa fa-camera" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

			<!-- Slide 3: Weddings & Celebrations -->
			<div class="carousel-item">
				<div class="hero-slide-bg" style="background-image: url('/images/weddings/full/Wedding-setup.jpg');">
					<div class="hero-overlay"></div>
					<div class="container h-100 d-flex flex-column justify-content-center align-items-center text-center position-relative py-5">
						<span class="badge bg-success bg-opacity-75 rounded-pill px-3 py-2 text-uppercase mb-3 fw-bold letter-spacing-1 shadow-sm">
							<i class="fa fa-heart me-1" aria-hidden="true"></i> Blufftop Ceremonies
						</span>
						<h2 class="display-3 font-playfair fw-bold text-white text-shadow mb-3 max-w-850">
							An Unforgettable Backdrop For Your Special Day
						</h2>
						<p class="lead text-white text-shadow fs-4 mb-4 max-w-750 d-none d-sm-block">
							Exchange vows in a stone arbor framed by evergreens with panoramic river and mountain vistas.
						</p>
						<div class="d-flex flex-wrap justify-content-center gap-3">
							<a href="/planyourspecialevent" class="btn btn-success btn-lg rounded-pill px-4 py-3 fw-bold shadow-lg">
								Weddings &amp; Events &nbsp;<i class="fa fa-glass" aria-hidden="true"></i>
							</a>
							<a href="https://ohmegardens.tripleseat.com/party_request/20439" target="_blank" rel="noopener noreferrer" class="btn btn-outline-light btn-lg rounded-pill px-4 py-3 fw-bold shadow-lg">
								Check Availability &nbsp;<i class="fa fa-calendar" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Carousel Controls (Accessible) -->
		<button class="carousel-control-prev" type="button" data-bs-target="##heroCarousel" data-bs-slide="prev" aria-label="Previous slide">
			<span class="carousel-control-prev-icon rounded-circle p-3" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="##heroCarousel" data-bs-slide="next" aria-label="Next slide">
			<span class="carousel-control-next-icon rounded-circle p-3" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>

	</div>
</section>

<!-- "In the Gardens Today" Live Experience Ribbon -->
<section class="garden-experience-bar py-3" aria-label="Garden Status & Daily Info">
	<div class="container">
		<div class="row align-items-center g-3 text-center text-md-start">
			<div class="col-12 col-md-3">
				<div class="garden-metric justify-content-center justify-content-md-start">
					<i class="fa fa-calendar-check-o metric-icon" aria-hidden="true"></i>
					<span><strong>Season:</strong> Open Daily (Apr 15 &ndash; Oct 15)</span>
				</div>
			</div>
			<div class="col-12 col-md-3">
				<div class="garden-metric justify-content-center justify-content-md-start">
					<i class="fa fa-clock-o metric-icon" aria-hidden="true"></i>
					<span><strong>Hours:</strong> 9:00 AM &ndash; 6:00 PM</span>
				</div>
			</div>
			<div class="col-12 col-md-3">
				<div class="garden-metric justify-content-center justify-content-md-start">
					<i class="fa fa-map-signs metric-icon" aria-hidden="true"></i>
					<span><strong>Trails:</strong> 1 Mile Hand-Carved Stone</span>
				</div>
			</div>
			<div class="col-12 col-md-3 text-center text-md-end">
				<div class="garden-metric justify-content-center justify-content-md-end">
					<i class="fa fa-map-marker metric-icon" aria-hidden="true"></i>
					<span><strong>Elevation:</strong> 1,200 ft Mountain Bluff</span>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- The 4 Classic Feature Tiles (Visit, Join, Connect, Live Cam) -->
<section id="features" class="features-section" aria-label="Garden Portals">
	<h2 class="visually-hidden">Explore Ohme Gardens</h2>
	<div class="container-fluid px-0">
		<div class="row g-0">

			<!-- Tile 1: Visit -->
			<div class="col-12 col-sm-6 col-lg-3 feature-tile-col">
				<a href="/planyourvisit" class="feature-tile tile-visit gallery-image visit" title="Plan Your Visit to Ohme Gardens">
					<div class="feature-tile-content">
						<div class="feature-tile-icon"><i class="fa fa-compass" aria-hidden="true"></i></div>
						<h3 class="feature-tile-title font-playfair">Visit &nbsp;<i class="fa fa-angle-right" aria-hidden="true"></i></h3>
						<p class="feature-tile-desc">Natural stone pathways traversing hillside gardens, past breathtaking panoramic views, towering cedars and firs, lush foliage, mesmerizing waterfall and tranquil pools.</p>
					</div>
					<div class="feature-tile-footer">
						<span class="feature-tile-arrow">Plan Your Visit &nbsp;<i class="fa fa-arrow-right" aria-hidden="true"></i></span>
					</div>
				</a>
			</div>

			<!-- Tile 2: Join -->
			<div class="col-12 col-sm-6 col-lg-3 feature-tile-col">
				<a href="/planyourvisit/page/gardens-membership" class="feature-tile tile-join gallery-image join" title="Ohme Gardens Membership">
					<div class="feature-tile-content">
						<div class="feature-tile-icon">
							<i class="fa fa-check-square-o" aria-hidden="true"></i>
						</div>
						<h3 class="feature-tile-title font-playfair">Join &nbsp;<i class="fa fa-angle-right" aria-hidden="true"></i></h3>
						<p class="feature-tile-desc">An Ohme Gardens membership is a perfect gift. Enjoy unlimited season admission, reciprocal admission benefits, guest passes, and special event invitations.</p>
					</div>
					<div class="feature-tile-footer">
						<span class="feature-tile-arrow">Become a Member &nbsp;<i class="fa fa-arrow-right" aria-hidden="true"></i></span>
					</div>
				</a>
			</div>

			<!-- Tile 3: Connect -->
			<div class="col-12 col-sm-6 col-lg-3 feature-tile-col">
				<a href="/getinvolved" class="feature-tile tile-connect gallery-image connect" title="Connect and Get Involved">
					<div class="feature-tile-content">
						<div class="feature-tile-icon"><i class="fa fa-users" aria-hidden="true"></i></div>
						<h3 class="feature-tile-title font-playfair">Connect &nbsp;<i class="fa fa-angle-right" aria-hidden="true"></i></h3>
						<p class="feature-tile-desc">Follow us on social media, attend community events, volunteer on the grounds, or support memorial benches and tributes in our 9-acre sanctuary.</p>
					</div>
					<div class="feature-tile-footer">
						<span class="feature-tile-arrow">Get Involved &nbsp;<i class="fa fa-arrow-right" aria-hidden="true"></i></span>
					</div>
				</a>
			</div>

			<!-- Tile 4: Live Cam -->
			<div class="col-12 col-sm-6 col-lg-3 feature-tile-col">
				<a href="/thegardens/camera" class="feature-tile tile-livecam gallery-image livecam" title="Watch Live Stream">
					<div class="feature-tile-content">
						<div class="feature-tile-icon"><i class="fa fa-video-camera" aria-hidden="true"></i></div>
						<h3 class="feature-tile-title font-playfair">Live Cam &nbsp;<i class="fa fa-angle-right" aria-hidden="true"></i></h3>
						<p class="feature-tile-desc">Take a live look at Ohme Gardens with real-time views overlooking Wenatchee, the Columbia River, and mountain ridge weather conditions.</p>
					</div>
					<div class="feature-tile-footer">
						<span class="feature-tile-arrow">Watch Live Cam &nbsp;<i class="fa fa-arrow-right" aria-hidden="true"></i></span>
					</div>
				</a>
			</div>

		</div>
	</div>
</section>

<!-- "The Heritage of the Gardens" Organic Story Banner -->
<section class="py-5" style="background-color: ##f5f8f3; border-top: 1px solid ##e2ebdb; border-bottom: 1px solid ##e2ebdb;">
	<div class="container">
		<div class="row align-items-center g-5">
			<div class="col-lg-6">
				<div class="card border-0 shadow-lg rounded-4 overflow-hidden">
					<img src="/images/thegarden-header-map.jpg" alt="Illustrated Map of Ohme Gardens trails and pools" class="img-fluid w-100" style="min-height: 280px; object-fit: cover;">
				</div>
			</div>
			<div class="col-lg-6">
				<span class="text-uppercase fw-bold text-success small" style="letter-spacing: 2px;">Since 1929</span>
				<h2 class="font-playfair display-6 fw-bold text-dark mt-1 mb-3">An Alpine Miracle Built by Hand</h2>
				<p class="text-secondary lead fs-6">What began as a dry, rocky promontory in 1929 was transformed over decades by Herman and Ruth Ohme into a lush alpine sanctuary. Using flagstone hauled by hand from the Columbia River hills, they built pathways, pools, and moss-draped waterfalls that endure today as a public county treasure.</p>
				<div class="d-flex flex-wrap gap-3 mt-4">
					<a href="/thegardens/page/the-history-of-ohme-gardens" class="btn btn-success rounded-pill px-4 py-2 fw-semibold">Discover Our History &nbsp;<i class="fa fa-book" aria-hidden="true"></i></a>
					<a href="/thegardens/page/map-of-the-gardens" class="btn btn-outline-dark rounded-pill px-4 py-2 fw-semibold">View Trail Map &nbsp;<i class="fa fa-map-o" aria-hidden="true"></i></a>
				</div>
			</div>
		</div>
	</div>
</section>
</cfoutput>
