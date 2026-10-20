<cfoutput>
<cfset bannerBg = "/images/thegarden-header-map.jpg">

<div class="main trail-map-section pb-5">

	<!-- Header section start -->
	<section class="module-small-2 bg-dark py-5 text-white" style="background-image:url(#bannerBg#); background-size: cover; background-position: center;">
		<div class="container py-3">
			<div class="row justify-content-center">
				<div class="col-12 text-center">
					<h1 class="module-title font-playfair display-4 text-white text-shadow my-4">Map of the Gardens</h1>
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
			<li class="breadcrumb-item active" aria-current="page">Map of the Gardens</li>
		</ol>
	</nav>
	<!-- Breadcrumbs end -->

	<!-- Interactive Trail Map Experience Start -->
	<div class="container py-2">

		<!-- Intro Header Row -->
		<div class="row align-items-end justify-content-between mb-4 pb-2">
			<div class="col-lg-8">
				<span class="text-uppercase fw-bold text-success small letter-spacing-1 d-block mb-1" style="color: ##1b4317 !important; letter-spacing: 0.1em;">A GARDEN MADE BY HAND SINCE 1929 &bull; WENATCHEE, WA</span>
				<h2 class="font-playfair display-5 fw-bold mb-3" style="color: ##1b4317;">Find your way through the wonder.</h2>
				<p class="text-secondary lead fs-6 mb-3">
					Wander <strong>one mile</strong> of natural hand-laid stone pathways, discover <strong>7 hidden alpine pools</strong>, listen to <strong>4 cascading waterfalls</strong>, and relax on <strong>53 historic stone benches</strong> overlooking the Columbia River and Cascade Mountains.
				</p>

				<!-- Stats Highlights Pills -->
				<div class="d-flex flex-wrap gap-2 pt-1">
					<span class="badge rounded-pill text-dark border px-3 py-2" style="background-color: ##eef4ea; font-size: 0.85rem;"><i class="fa fa-map-signs text-success me-1"></i> 1 Mile of Stone Paths</span>
					<span class="badge rounded-pill text-dark border px-3 py-2" style="background-color: ##eef4ea; font-size: 0.85rem;"><i class="fa fa-tint text-primary me-1"></i> 7 Alpine Pools</span>
					<span class="badge rounded-pill text-dark border px-3 py-2" style="background-color: ##eef4ea; font-size: 0.85rem;"><i class="fa fa-shower text-info me-1"></i> 4 Cascading Waterfalls</span>
					<span class="badge rounded-pill text-dark border px-3 py-2" style="background-color: ##eef4ea; font-size: 0.85rem;"><i class="fa fa-chair text-secondary me-1"></i> 53 Stone Benches</span>
				</div>
			</div>
			<div class="col-lg-4 text-lg-end mt-4 mt-lg-0">
				<div class="d-inline-flex flex-column align-items-lg-end gap-2">
					<span class="status-pill-open shadow-sm">
						<span class="status-dot-pulse" aria-hidden="true"></span>
						<span>Open daily &middot; 9:00 am&ndash;6:00 pm</span>
					</span>
					<button type="button" class="btn btn-outline-success btn-sm rounded-pill px-3 fw-bold" data-bs-toggle="modal" data-bs-target="##fullTrailMapModal">
						<i class="fa fa-map-o me-1"></i> View Official Printable Map
					</button>
				</div>
			</div>
		</div>

		<!-- Map Canvas & Detail Card Row -->
		<div class="row g-4" id="illustrated-garden-map">

			<!-- Left Column: The Interactive Illustrated Trail Map -->
			<div class="col-lg-7 col-xl-8">
				<div class="garden-map-card shadow-sm">

					<!-- Card Header with Multi-Category Filters -->
					<div class="d-flex flex-wrap align-items-center justify-content-between p-3 px-md-4 border-bottom bg-white">
						<div>
							<h3 class="font-playfair fs-4 fw-bold mb-0 text-dark">Explore the Garden Trails</h3>
							<small class="text-muted">Tap any numbered location to explore destinations along the trail</small>
						</div>
						<div class="d-flex flex-wrap gap-2 mt-2 mt-md-0" role="group" aria-label="Trail filter categories">
							<button type="button" class="garden-map-filter-btn active" data-filter="all" aria-pressed="true">All Places (11)</button>
							<button type="button" class="garden-map-filter-btn" data-filter="easy" aria-pressed="false">Easy Stroll</button>
							<button type="button" class="garden-map-filter-btn" data-filter="pools" aria-pressed="false">Waterfalls &amp; Pools</button>
							<button type="button" class="garden-map-filter-btn" data-filter="viewpoints" aria-pressed="false">Viewpoints &amp; Lodges</button>
						</div>
					</div>

					<!-- Illustrated Vector Map Canvas with Interactive Overlay -->
					<div class="garden-map-canvas-wrap">

						<!-- SVG Illustrated Map Canvas (True Ohme Gardens Geography) -->
						<svg viewBox="0 0 900 780" class="w-100 h-auto" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Authentic illustrated map of Ohme Gardens pathways, pools, waterfalls, and scenic viewpoints">
							<defs>
								<!-- Shadow Filters -->
								<filter id="trailShadow" x="-10%" y="-10%" width="120%" height="120%">
									<feDropShadow dx="0" dy="2" stdDeviation="2.5" flood-color="##000000" flood-opacity="0.18"/>
								</filter>
								<filter id="softGlow" x="-20%" y="-20%" width="140%" height="140%">
									<feGaussianBlur stdDeviation="3" result="blur"/>
									<feComposite in="SourceGraphic" in2="blur" operator="over"/>
								</filter>

								<!-- Topographical & Landscape Gradients -->
								<linearGradient id="ridgeBg" x1="0%" y1="0%" x2="100%" y2="100%">
									<stop offset="0%" stop-color="##e6eee0"/>
									<stop offset="60%" stop-color="##dce7d1"/>
									<stop offset="100%" stop-color="##d3e0c6"/>
								</linearGradient>

								<linearGradient id="columbiaRiver" x1="0%" y1="0%" x2="100%" y2="0%">
									<stop offset="0%" stop-color="##4b7d94"/>
									<stop offset="85%" stop-color="##6c9bb2"/>
									<stop offset="100%" stop-color="##8db5c8"/>
								</linearGradient>

								<!-- Water Pool Gradient -->
								<radialGradient id="poolAqua" cx="40%" cy="40%" r="60%">
									<stop offset="0%" stop-color="##aee1f5"/>
									<stop offset="50%" stop-color="##70b5d5"/>
									<stop offset="100%" stop-color="##4a8fae"/>
								</radialGradient>

								<!-- Lawn Gradients -->
								<linearGradient id="lawnEmerald" x1="0%" y1="0%" x2="100%" y2="100%">
									<stop offset="0%" stop-color="##38b056"/>
									<stop offset="100%" stop-color="##1e7a35"/>
								</linearGradient>

								<linearGradient id="lawnSoft" x1="0%" y1="0%" x2="100%" y2="100%">
									<stop offset="0%" stop-color="##4cb865"/>
									<stop offset="100%" stop-color="##2b8743"/>
								</linearGradient>

								<!-- Conifer Tree Symbol -->
								<g id="coniferTree">
									<polygon points="0,-16 6,-6 2,-6 7,3 2,3 8,12 -8,12 -2,3 -7,3 -2,-6 -6,-6" fill="##426339" opacity="0.85"/>
									<rect x="-1.5" y="12" width="3" height="4" fill="##543d2b"/>
								</g>

								<!-- Stone Bench Symbol -->
								<g id="stoneBenchIcon">
									<rect x="-7" y="-3" width="14" height="6" rx="2" fill="##ffffff" stroke="##495057" stroke-width="1.2"/>
									<rect x="-6" y="-6" width="12" height="3" rx="1" fill="##dce4d5" stroke="##495057" stroke-width="0.8"/>
								</g>
							</defs>

							<!-- Base Garden Promontory Shape -->
							<rect width="900" height="780" fill="##e4ecd8"/>
							<path d="M 120,40 Q 350,15 650,45 Q 860,110 820,380 Q 770,620 540,730 Q 320,770 180,720 Q 90,620 110,410 Z" fill="url(##ridgeBg)" stroke="##cad8be" stroke-width="3"/>

							<!-- Columbia River Curved Strip (West/Upper-Left Rim) -->
							<path d="M 0,0 L 80,0 Q 60,250 85,460 Q 110,640 40,780 L 0,780 Z" fill="url(##columbiaRiver)"/>
							<text x="25" y="420" transform="rotate(-90 25,420)" font-family="'Raleway', sans-serif" font-size="13" font-weight="800" letter-spacing="0.25em" fill="##ffffff" opacity="0.9">COLUMBIA RIVER</text>

							<!-- Compass Rose (South-North Orientation Indicator) -->
							<g transform="translate(830, 680)">
								<circle cx="0" cy="0" r="32" fill="##ffffff" opacity="0.95" stroke="##2D5A27" stroke-width="1.5" filter="url(##trailShadow)"/>
								<!-- Compass Points -->
								<polygon points="0,-26 5,-5 0,0 -5,-5" fill="##8c3b27"/>
								<polygon points="0,26 5,5 0,0 -5,5" fill="##1b4317"/>
								<polygon points="-26,0 -5,5 0,0 -5,-5" fill="##4a748c"/>
								<polygon points="26,0 5,5 0,0 5,-5" fill="##4a748c"/>
								<text x="0" y="-12" font-family="'Raleway', sans-serif" font-size="9" font-weight="900" fill="##ffffff" text-anchor="middle">S</text>
								<text x="0" y="18" font-family="'Raleway', sans-serif" font-size="9" font-weight="900" fill="##ffffff" text-anchor="middle">N</text>
								<text x="-15" y="3" font-family="'Raleway', sans-serif" font-size="8" font-weight="800" fill="##4a748c" text-anchor="middle">E</text>
								<text x="15" y="3" font-family="'Raleway', sans-serif" font-size="8" font-weight="800" fill="##4a748c" text-anchor="middle">W</text>
							</g>

							<!-- Scale Indicator (100 FT) -->
							<g transform="translate(775, 740)">
								<line x1="0" y1="0" x2="60" y2="0" stroke="##1b4317" stroke-width="2"/>
								<line x1="0" y1="-4" x2="0" y2="4" stroke="##1b4317" stroke-width="2"/>
								<line x1="60" y1="-4" x2="60" y2="4" stroke="##1b4317" stroke-width="2"/>
								<text x="30" y="-6" font-family="'Raleway', sans-serif" font-size="10" font-weight="800" fill="##1b4317" text-anchor="middle">100 FT</text>
							</g>

							<!-- Native Conifer & Evergreen Groves (Scattered per Official Map) -->
							<use href="##coniferTree" x="220" y="110"/>
							<use href="##coniferTree" x="480" y="65"/>
							<use href="##coniferTree" x="710" y="55"/>
							<use href="##coniferTree" x="790" y="145"/>
							<use href="##coniferTree" x="650" y="160"/>
							<use href="##coniferTree" x="580" y="240"/>
							<use href="##coniferTree" x="460" y="365"/>
							<use href="##coniferTree" x="380" y="260"/>
							<use href="##coniferTree" x="290" y="470"/>
							<use href="##coniferTree" x="190" y="680"/>
							<use href="##coniferTree" x="250" y="620"/>
							<use href="##coniferTree" x="350" y="740"/>
							<use href="##coniferTree" x="520" y="490"/>

							<!-- LAWN AREAS -->
							<!-- 1. Lower Lawn (Large iconic kidney lawn) -->
							<path d="M 540,310 C 610,290 640,350 635,410 C 630,460 570,490 535,465 C 495,435 480,340 540,310 Z" fill="url(##lawnEmerald)" opacity="0.95" filter="url(##trailShadow)"/>
							<text x="565" y="390" font-family="'Playfair Display', serif" font-size="13" font-weight="700" fill="##ffffff" text-anchor="middle" letter-spacing="0.05em">Lower Lawn</text>

							<!-- 2. Entrance Lawn -->
							<path d="M 405,535 C 430,520 450,545 440,565 C 425,580 395,570 405,535 Z" fill="url(##lawnSoft)" opacity="0.9"/>
							<text x="420" y="555" font-family="'Raleway', sans-serif" font-size="9" font-weight="800" fill="##ffffff" text-anchor="middle">Entrance Lawn</text>

							<!-- 3. Sunken Lawn (adjacent to Lower Lawn) -->
							<path d="M 585,475 C 605,465 615,485 610,500 C 600,510 580,505 585,475 Z" fill="url(##lawnSoft)" opacity="0.85"/>
							<text x="596" y="490" font-family="'Raleway', sans-serif" font-size="8" font-weight="700" fill="##ffffff" text-anchor="middle">Sunken Lawn</text>

							<!-- 7 ALPINE POOLS -->
							<!-- Pool 1: Sylvan Pool (Stop 2) -->
							<ellipse cx="440" cy="390" rx="25" ry="18" fill="url(##poolAqua)" filter="url(##softGlow)"/>
							<text x="440" y="394" font-family="'Raleway', sans-serif" font-size="8" font-weight="800" fill="##153d52" text-anchor="middle">Sylvan Pool</text>

							<!-- Pool 2: Hidden Pool (Stop 9) -->
							<ellipse cx="585" cy="85" rx="28" ry="18" fill="url(##poolAqua)" filter="url(##softGlow)"/>
							<text x="585" y="89" font-family="'Raleway', sans-serif" font-size="8" font-weight="800" fill="##153d52" text-anchor="middle">Hidden Pool</text>

							<!-- Pools 3 & 4: Twin Pools (Stop 10) -->
							<ellipse cx="780" cy="205" rx="19" ry="15" fill="url(##poolAqua)"/>
							<ellipse cx="760" cy="225" rx="14" ry="11" fill="url(##poolAqua)"/>
							<text x="760" y="212" font-family="'Raleway', sans-serif" font-size="8" font-weight="800" fill="##153d52" text-anchor="middle">Twin Pools</text>

							<!-- Pool 5: Top Pool (Decision Point, Stop 6) -->
							<ellipse cx="270" cy="625" rx="16" ry="12" fill="url(##poolAqua)"/>
							<text x="295" y="632" font-family="'Raleway', sans-serif" font-size="7" font-weight="700" fill="##153d52">Top Pool</text>

							<!-- Pool 6: Sunken Lawn Pool (Moment-In-Time, Stop 4) -->
							<ellipse cx="600" cy="525" rx="15" ry="10" fill="url(##poolAqua)"/>

							<!-- Pool 7: Enchantment Pool (Stop 11) -->
							<ellipse cx="625" cy="305" rx="13" ry="9" fill="url(##poolAqua)"/>

							<!-- 4 WATERFALLS (Cyan Rushing Water Accents) -->
							<!-- Waterfall 1: Moment-in-Time Waterfall (Stop 4) -->
							<path d="M 600,518 L 600,530" stroke="##2ba2d6" stroke-width="4" stroke-linecap="round"/>
							<!-- Waterfall 2: Decision Point Falls (Stop 6) -->
							<path d="M 270,618 L 270,630" stroke="##2ba2d6" stroke-width="4" stroke-linecap="round"/>
							<!-- Waterfall 3: Enchantment Falls (Stop 11) -->
							<path d="M 625,298 L 625,310" stroke="##2ba2d6" stroke-width="4" stroke-linecap="round"/>

							<!-- HISTORIC STONE BUILDINGS (Brown/Cedar Shacks) -->
							<!-- Ox Yoke Lodge / Gift Shop (Stop 1) -->
							<polygon points="415,585 450,580 445,615 410,615" fill="##664a34" stroke="##3b291c" stroke-width="1.5"/>
							<polygon points="410,615 445,615 440,640 405,640" fill="##85583b" stroke="##3b291c" stroke-width="1.5"/>
							<text x="428" y="630" font-family="'Raleway', sans-serif" font-size="7" font-weight="900" fill="##ffffff" text-anchor="middle">GIFT SHOP</text>

							<!-- Totem Pole Lodge (Stop 3) -->
							<polygon points="615,385 645,395 635,425 605,415" fill="##664a34" stroke="##3b291c" stroke-width="1.5"/>

							<!-- Vista House (Stop 5) -->
							<rect x="135" y="605" width="28" height="24" rx="3" fill="##7a5d45" stroke="##3b291c" stroke-width="1.5"/>
							<polygon points="130,605 149,590 168,605" fill="##543d2b"/>
							<text x="149" y="620" font-family="'Raleway', sans-serif" font-size="7" font-weight="800" fill="##ffffff" text-anchor="middle">VISTA</text>

							<!-- PATHWAYS (Layered by Difficulty matching the Official Trail Map Legend) -->
							<!-- 1. EASY PATHS (Terra-cotta / Brick Stone ##9e5341) -->
							<!-- Entrance Loop & Ox Yoke Lodge -->
							<path d="M 425,660 C 420,620 400,580 380,560 C 360,540 385,500 420,490 C 455,480 480,510 475,560 C 470,610 450,640 425,660"
								fill="none" stroke="##9e5341" stroke-width="7" stroke-dasharray="10,2" stroke-linecap="round" filter="url(##trailShadow)"/>

							<!-- Central Path from Entrance to Sylvan Pool -->
							<path d="M 420,490 C 410,450 425,420 440,410 C 455,400 480,410 495,430 C 515,450 540,460 580,465"
								fill="none" stroke="##9e5341" stroke-width="7" stroke-dasharray="10,2" stroke-linecap="round" filter="url(##trailShadow)"/>

							<!-- Lower Lawn & Totem Pole Lodge Perimeter Path -->
							<path d="M 520,460 C 510,410 515,340 545,305 C 585,280 635,320 645,370 C 655,420 640,460 610,480 C 580,500 550,495 520,460"
								fill="none" stroke="##9e5341" stroke-width="7" stroke-dasharray="10,2" stroke-linecap="round" filter="url(##trailShadow)"/>

							<!-- Path to Moment-In-Time Waterfall -->
							<path d="M 580,465 C 570,500 550,540 520,570 C 490,600 440,610 435,590"
								fill="none" stroke="##9e5341" stroke-width="7" stroke-dasharray="10,2" stroke-linecap="round"/>

							<!-- 2. MODERATE PATHS (Slate / Mountain Blue ##4c7f99) -->
							<!-- Western Ridge Loop: From Sylvan Pool -> Campfire Pit -> U-Bench -->
							<path d="M 425,420 C 370,410 320,460 270,510 C 230,550 200,580 180,600 C 160,540 210,460 270,390 C 330,320 390,260 460,200 C 500,165 470,140 450,160"
								fill="none" stroke="##4c7f99" stroke-width="6" stroke-dasharray="8,3" stroke-linecap="round" filter="url(##trailShadow)"/>

							<!-- Path from U-Bench -> Hidden Pool -->
							<path d="M 450,160 C 455,120 510,100 560,95 C 600,90 625,60 620,40"
								fill="none" stroke="##4c7f99" stroke-width="6" stroke-dasharray="8,3" stroke-linecap="round" filter="url(##trailShadow)"/>

							<!-- Path from Lower Lawn -> Enchantment Falls & Cactus Point -->
							<path d="M 545,305 C 570,270 610,270 640,290 C 670,310 710,340 720,360"
								fill="none" stroke="##4c7f99" stroke-width="6" stroke-dasharray="8,3" stroke-linecap="round"/>

							<!-- 3. STEEP PATHS (Golden Ochre ##c4992b) -->
							<!-- Steep Staircase down to Canadian Point & Wishing Well -->
							<path d="M 135,620 C 120,660 115,700 120,730 C 125,750 110,760 100,750"
								fill="none" stroke="##c4992b" stroke-width="6" stroke-dasharray="6,4" stroke-linecap="round" filter="url(##trailShadow)"/>

							<!-- Steep Staircase from Decision Point up to Vista House -->
							<path d="M 255,625 C 220,615 190,625 165,615"
								fill="none" stroke="##c4992b" stroke-width="6" stroke-dasharray="6,4" stroke-linecap="round"/>

							<!-- Steep Trail to Twin Pools -->
							<path d="M 640,290 C 680,240 720,200 760,195 C 800,190 820,225 790,260 C 760,295 720,320 680,310"
								fill="none" stroke="##c4992b" stroke-width="6" stroke-dasharray="6,4" stroke-linecap="round"/>

							<!-- STONE BENCHES (Sample of the 53 authentic stone perches) -->
							<use href="##stoneBenchIcon" x="460" y="165" transform="rotate(-30 460,165)"/> <!-- U-Bench -->
							<use href="##stoneBenchIcon" x="550" y="85"/> <!-- Hidden Pool Bench -->
							<use href="##stoneBenchIcon" x="430" y="425"/> <!-- Hobbit Bench -->
							<use href="##stoneBenchIcon" x="140" y="595"/> <!-- Vista House Bench -->
							<use href="##stoneBenchIcon" x="110" y="740"/> <!-- Canadian Point Bench -->
							<use href="##stoneBenchIcon" x="540" y="475"/> <!-- Sunken Lawn Bench -->
							<use href="##stoneBenchIcon" x="770" y="240"/> <!-- Twin Pools Bench -->

							<!-- TOPOGRAPHICAL LANDMARK LABELS -->
							<text x="730" y="340" font-family="'Raleway', sans-serif" font-size="9" font-weight="700" fill="##4a6b41">Cactus Point</text>
							<text x="365" y="450" font-family="'Raleway', sans-serif" font-size="8" font-weight="700" fill="##4a6b41">Hobbit Bench</text>
							<text x="475" y="165" font-family="'Raleway', sans-serif" font-size="8" font-weight="700" fill="##4a6b41">U-Bench</text>
							<text x="145" y="740" font-family="'Raleway', sans-serif" font-size="8" font-weight="800" fill="##33522a">Canadian Point</text>
						</svg>

						<!-- HTML INTERACTIVE PINS (11 Official Destinations) -->
						<!-- Stop 1: Entrance & Ox Yoke Lodge -->
						<button type="button" class="garden-map-pin active" data-stop-id="1" style="left: 48%; top: 79%;" aria-label="Stop 1: Garden Entrance & Ox Yoke Lodge" aria-selected="true">
							<span class="pin-num">1</span>
							<span class="pin-title">Entrance &amp; Lodge</span>
						</button>

						<!-- Stop 2: Sylvan Pool & Hobbit Bench -->
						<button type="button" class="garden-map-pin" data-stop-id="2" style="left: 49%; top: 49%;" aria-label="Stop 2: Sylvan Pool & Hobbit Bench" aria-selected="false">
							<span class="pin-num">2</span>
							<span class="pin-title">Sylvan Pool</span>
						</button>

						<!-- Stop 3: Lower Lawn & Totem Pole Lodge -->
						<button type="button" class="garden-map-pin" data-stop-id="3" style="left: 65%; top: 45%;" aria-label="Stop 3: Lower Lawn & Totem Pole Lodge" aria-selected="false">
							<span class="pin-num">3</span>
							<span class="pin-title">Lower Lawn</span>
						</button>

						<!-- Stop 4: Moment-In-Time Waterfall -->
						<button type="button" class="garden-map-pin" data-stop-id="4" style="left: 67%; top: 66%;" aria-label="Stop 4: Moment-In-Time Waterfall" aria-selected="false">
							<span class="pin-num">4</span>
							<span class="pin-title">Moment-In-Time Falls</span>
						</button>

						<!-- Stop 5: Vista House -->
						<button type="button" class="garden-map-pin" data-stop-id="5" style="left: 17%; top: 78%;" aria-label="Stop 5: Vista House" aria-selected="false">
							<span class="pin-num">5</span>
							<span class="pin-title">Vista House</span>
						</button>

						<!-- Stop 6: Decision Point Falls & Top Pool -->
						<button type="button" class="garden-map-pin" data-stop-id="6" style="left: 31%; top: 79%;" aria-label="Stop 6: Decision Point Falls & Top Pool" aria-selected="false">
							<span class="pin-num">6</span>
							<span class="pin-title">Decision Point Falls</span>
						</button>

						<!-- Stop 7: Canadian Point & Wishing Well -->
						<button type="button" class="garden-map-pin" data-stop-id="7" style="left: 12%; top: 93%;" aria-label="Stop 7: Canadian Point & Wishing Well" aria-selected="false">
							<span class="pin-num">7</span>
							<span class="pin-title">Canadian Point</span>
						</button>

						<!-- Stop 8: U-Bench & Campfire Pit -->
						<button type="button" class="garden-map-pin" data-stop-id="8" style="left: 49%; top: 22%;" aria-label="Stop 8: U-Bench & Campfire Pit" aria-selected="false">
							<span class="pin-num">8</span>
							<span class="pin-title">U-Bench</span>
						</button>

						<!-- Stop 9: Hidden Pool & Library -->
						<button type="button" class="garden-map-pin" data-stop-id="9" style="left: 65%; top: 11%;" aria-label="Stop 9: Hidden Pool & Little Free Library" aria-selected="false">
							<span class="pin-num">9</span>
							<span class="pin-title">Hidden Pool</span>
						</button>

						<!-- Stop 10: Twin Pools -->
						<button type="button" class="garden-map-pin" data-stop-id="10" style="left: 85%; top: 27%;" aria-label="Stop 10: Twin Pools" aria-selected="false">
							<span class="pin-num">10</span>
							<span class="pin-title">Twin Pools</span>
						</button>

						<!-- Stop 11: Enchantment Falls & Cactus Point -->
						<button type="button" class="garden-map-pin" data-stop-id="11" style="left: 77%; top: 40%;" aria-label="Stop 11: Enchantment Falls & Cactus Point" aria-selected="false">
							<span class="pin-num">11</span>
							<span class="pin-title">Enchantment Falls</span>
						</button>

					</div>

					<!-- Map Legend Footer (Matching Official Trail Map Legend) -->
					<div class="d-flex flex-wrap align-items-center justify-content-between p-3 px-md-4 bg-white border-top small text-secondary">
						<div class="d-flex flex-wrap align-items-center gap-3">
							<!-- Easy Trail -->
							<span class="d-inline-flex align-items-center gap-1">
								<span style="display:inline-block; width:16px; height:5px; background-color:##9e5341; border-radius:2px;"></span>
								<strong class="ms-1 text-dark">Easy:</strong> Gentle flagstone
							</span>
							<!-- Moderate Trail -->
							<span class="d-inline-flex align-items-center gap-1">
								<span style="display:inline-block; width:16px; height:5px; background-color:##4c7f99; border-radius:2px;"></span>
								<strong class="ms-1 text-dark">Moderate:</strong> Gentle inclines
							</span>
							<!-- Steep Trail -->
							<span class="d-inline-flex align-items-center gap-1">
								<span style="display:inline-block; width:16px; height:5px; background-color:##c4992b; border-radius:2px;"></span>
								<strong class="ms-1 text-dark">Steep:</strong> Stone staircases
							</span>
						</div>
						<div class="text-muted mt-2 mt-sm-0 fst-italic">
							Interactive guide based on official Ohme trail map &middot; not to scale
						</div>
					</div>

				</div>
			</div>

			<!-- Right Column: Interactive Destination Detail Card -->
			<div class="col-lg-5 col-xl-4">
				<aside aria-label="Garden destination details" class="garden-detail-card shadow-sm h-100 d-flex flex-column justify-content-between" id="garden-stop-detail-card">

					<div>
						<!-- Visual Header with Image & Italic Pull-Quote -->
						<div class="garden-detail-banner">
							<img src="/images/garden/full/Gallery20.jpg" alt="Garden Entrance & Ox Yoke Lodge at Ohme Gardens" id="stop-detail-image" class="img-fluid">
							<div class="garden-detail-quote" id="stop-detail-quote">
								Where your alpine journey begins
							</div>
						</div>

						<!-- Card Body -->
						<div class="p-4">
							<div class="text-uppercase fw-bold small mb-1" id="stop-detail-kicker" style="color: ##1b4317; letter-spacing: 0.08em;">
								WELCOME &bull; TRAILHEAD START
							</div>
							<h3 class="font-playfair fs-2 fw-bold text-dark mb-3" id="stop-detail-title">
								Garden Entrance &amp; Ox Yoke Lodge
							</h3>
							<p class="text-secondary mb-3" id="stop-detail-desc" style="line-height: 1.65;">
								The historic stone entrance, admissions pavilion, and Ox Yoke Lodge welcome you to Ohme Gardens. Pick up a printed trail guide, browse the Gift Shop, fill your water bottle at Stump Water, and access restrooms before starting your walk.
							</p>

							<!-- Two-Column Meta Box -->
							<div class="garden-meta-box">
								<div class="row g-2">
									<div class="col-6">
										<div class="garden-meta-label" id="stop-detail-walk-time">0 min walk</div>
										<div class="garden-meta-sub" id="stop-detail-walk-detail">trailhead start</div>
									</div>
									<div class="col-6">
										<div class="garden-meta-label" id="stop-detail-diff">Easy path</div>
										<div class="garden-meta-sub" id="stop-detail-diff-detail">level flagstone entry</div>
									</div>
								</div>
							</div>

							<!-- Amenities & Features Badges -->
							<div class="mb-2">
								<span class="text-muted small fw-bold d-block mb-1">HIGHLIGHTS AT THIS STOP:</span>
								<div id="stop-detail-features" class="d-flex flex-wrap">
									<span class="badge rounded-pill bg-light text-dark border me-1 mb-1 font-raleway py-1 px-2">Admissions &amp; Gift Shop</span>
									<span class="badge rounded-pill bg-light text-dark border me-1 mb-1 font-raleway py-1 px-2">Restrooms</span>
									<span class="badge rounded-pill bg-light text-dark border me-1 mb-1 font-raleway py-1 px-2">Stump Water</span>
									<span class="badge rounded-pill bg-light text-dark border me-1 mb-1 font-raleway py-1 px-2">Entrance Lawn</span>
								</div>
							</div>

						</div>
					</div>

					<!-- Card Footer Actions -->
					<div class="p-4 pt-0">
						<button type="button" class="btn garden-explore-btn mb-3" id="stop-detail-btn" data-stop-id="1">
							EXPLORE THIS PLACE &nbsp;&nearr;
						</button>
						<div class="text-center">
							<a href="##" class="text-decoration-underline text-secondary small fw-semibold" data-bs-toggle="modal" data-bs-target="##fullTrailMapModal">
								See the full official trail map
							</a>
						</div>
					</div>

				</aside>
			</div>

		</div>
		<!-- Map Canvas & Detail Card Row End -->

	</div>
	<!-- Interactive Trail Map Experience End -->

</div>

<!-- High-Resolution Official Trail Map Modal -->
<div class="modal fade" id="fullTrailMapModal" tabindex="-1" aria-labelledby="fullTrailMapModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered">
		<div class="modal-content rounded-4 border-0 shadow-lg">
			<div class="modal-header border-bottom px-4">
				<div>
					<h2 class="modal-title font-playfair fs-4 text-dark mb-0" id="fullTrailMapModalLabel">Ohme Gardens &middot; Official Trail Map</h2>
					<small class="text-muted">1 Mile of Natural Stone Paths &bull; 53 Stone Benches &bull; 7 Pools &bull; 4 Waterfalls</small>
				</div>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body text-center p-3 bg-light">
				<img src="/images/ohme-official-trail-map.jpg" alt="Official detailed trail map of Ohme Gardens with all paths, benches, pools, waterfalls, and 100ft scale" class="img-fluid rounded-3 shadow-sm" style="max-height: 75vh; width: auto;">
			</div>
			<div class="modal-footer border-top px-4 d-flex justify-content-between align-items-center">
				<span class="text-muted small">Front Office phone: (509) 662-5785. Pick up a printed paper copy at Ox Yoke Lodge.</span>
				<div class="d-flex gap-2">
					<a href="/images/ohme-official-trail-map.jpg" download="Ohme-Gardens-Official-Trail-Map.jpg" class="btn btn-success rounded-pill px-4 fw-bold">
						<i class="fa fa-download me-1" aria-hidden="true"></i> Download Map
					</a>
					<button type="button" class="btn btn-secondary rounded-pill px-4" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Stop Photo Detail Modal (When EXPLORE THIS PLACE is clicked) -->
<div class="modal fade" id="stopDetailModal" tabindex="-1" aria-labelledby="stopModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content rounded-4 border-0 shadow-lg">
			<div class="modal-header border-bottom px-4">
				<h2 class="modal-title font-playfair fs-4 text-dark" id="stopModalLabel">Stop Details</h2>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body p-4 text-center">
				<img src="/images/garden/full/Gallery20.jpg" alt="" id="stopModalImage" class="img-fluid rounded-4 shadow-sm mb-3" style="max-height: 55vh; width: auto;">
				<p class="text-secondary lead fs-6 text-start mb-0" id="stopModalDesc"></p>
			</div>
			<div class="modal-footer border-top px-4 d-flex justify-content-between">
				<a href="/thegardens/photo-gallery" class="btn btn-outline-success rounded-pill px-3 fw-semibold">
					View All Photos in Gallery
				</a>
				<button type="button" class="btn btn-secondary rounded-pill px-4" data-bs-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- Load Garden Map Interactive Script -->
<script src="/javascripts/garden-map.js" defer></script>
</cfoutput>
