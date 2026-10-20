<cfoutput>
<cfset sectionTitle = capitalizeSection(currentSection)>
<cfset bannerBg = "/images/landing-page-3.jpg">
<cfif currentSection EQ "planyourvisit">
	<cfset bannerBg = "/images/planyourvisit.jpg">
<cfelseif currentSection EQ "planyourspecialevent">
	<cfset bannerBg = "/images/Plan-Your-Special-Event.jpg">
<cfelseif currentSection EQ "getinvolved">
	<cfset bannerBg = "/images/Get-Involved.jpg">
<cfelseif currentSection EQ "events">
	<cfset bannerBg = "/images/landing-page-5.jpg">
</cfif>

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
			<cfif Len(currentSection)>
				<li class="breadcrumb-item"><a href="/#currentSection#">#EncodeForHTML(sectionTitle)#</a></li>
			</cfif>
			<li class="breadcrumb-item active" aria-current="page">#EncodeForHTML(content.Title)#</li>
		</ol>
	</nav>
	<!-- Breadcrumbs end -->

	<!-- Content section start -->
	<section class="module-2 pt-0 pb-5">
		<div class="container">
			<div class="row g-4">

				<!-- Left Subnav Column -->
				<aside class="col-lg-3 sidebar" aria-label="Section Navigation">
					<ul class="list-group sidebar-nav-v1 font-raleway shadow-sm" id="sidebar-nav">
						<cfif currentSection EQ "thegardens">
							<li class="list-group-item #(currentSlug EQ 'the-history-of-ohme-gardens' ? 'active' : '')#" #(currentSlug EQ 'the-history-of-ohme-gardens' ? 'aria-current="page"' : '')#><a href="/thegardens/page/the-history-of-ohme-gardens">The History of Ohme Gardens</a></li>
							<li class="list-group-item #(currentSlug EQ 'about-us' ? 'active' : '')#" #(currentSlug EQ 'about-us' ? 'aria-current="page"' : '')#><a href="/thegardens/page/about-us">About Us</a></li>
							<li class="list-group-item #(currentSlug EQ 'photo-gallery' ? 'active' : '')#" #(currentSlug EQ 'photo-gallery' ? 'aria-current="page"' : '')#><a href="/thegardens/photo-gallery">Photo Gallery</a></li>
							<li class="list-group-item #(currentSlug EQ 'map-of-the-gardens' ? 'active' : '')#" #(currentSlug EQ 'map-of-the-gardens' ? 'aria-current="page"' : '')#><a href="/thegardens/page/map-of-the-gardens">Map of the Gardens</a></li>
						<cfelseif currentSection EQ "planyourvisit">
							<li class="list-group-item #(currentSlug EQ 'hours-and-admission' ? 'active' : '')#" #(currentSlug EQ 'hours-and-admission' ? 'aria-current="page"' : '')#><a href="/planyourvisit/page/hours-and-admission">Hours and Admissions</a></li>
							<li class="list-group-item #(currentSlug EQ 'gardens-membership' ? 'active' : '')#" #(currentSlug EQ 'gardens-membership' ? 'aria-current="page"' : '')#><a href="/planyourvisit/page/gardens-membership">Memberships</a></li>
							<li class="list-group-item #(currentSlug EQ 'driving-directions' ? 'active' : '')#" #(currentSlug EQ 'driving-directions' ? 'aria-current="page"' : '')#><a href="/planyourvisit/page/driving-directions">Directions</a></li>
							<li class="list-group-item #(currentSlug EQ 'group-rates' ? 'active' : '')#" #(currentSlug EQ 'group-rates' ? 'aria-current="page"' : '')#><a href="/planyourvisit/page/group-rates">Group Rates</a></li>
						<cfelseif currentSection EQ "events">
							<li class="list-group-item #(currentSlug EQ 'comedy-in-the-gardens' ? 'active' : '')#" #(currentSlug EQ 'comedy-in-the-gardens' ? 'aria-current="page"' : '')#><a href="/events/page/comedy-in-the-gardens">Comedy in the Gardens</a></li>
							<li class="list-group-item #(currentSlug EQ 'sound-healing--yoga-nidra-at-ohme-gardens' ? 'active' : '')#" #(currentSlug EQ 'sound-healing--yoga-nidra-at-ohme-gardens' ? 'aria-current="page"' : '')#><a href="/events/page/sound-healing--yoga-nidra-at-ohme-gardens">Sound Healing + Yoga Nidra</a></li>
							<li class="list-group-item #(currentSlug EQ 'movies-in-the-gardens' ? 'active' : '')#" #(currentSlug EQ 'movies-in-the-gardens' ? 'aria-current="page"' : '')#><a href="/events/page/movies-in-the-gardens">Movies in the Gardens</a></li>
							<li class="list-group-item #(currentSlug EQ 'gnomes-and-fairies-in-the-gardens' ? 'active' : '')#" #(currentSlug EQ 'gnomes-and-fairies-in-the-gardens' ? 'aria-current="page"' : '')#><a href="/events/page/gnomes-and-fairies-in-the-gardens">Gnomes and Fairies</a></li>
							<li class="list-group-item #(currentSlug EQ 'make-a-difference-day' ? 'active' : '')#" #(currentSlug EQ 'make-a-difference-day' ? 'aria-current="page"' : '')#><a href="/events/page/make-a-difference-day">Make a Difference Day</a></li>
							<li class="list-group-item #(currentSlug EQ 'story-hour-in-the-gardens' ? 'active' : '')#" #(currentSlug EQ 'story-hour-in-the-gardens' ? 'aria-current="page"' : '')#><a href="/events/page/story-hour-in-the-gardens">Story Hour in the Garden</a></li>
							<li class="list-group-item #(currentSlug EQ 'roots--rhythm' ? 'active' : '')#" #(currentSlug EQ 'roots--rhythm' ? 'aria-current="page"' : '')#><a href="/events/page/roots--rhythm">Roots &amp; Rhythm</a></li>
						<cfelseif currentSection EQ "planyourspecialevent">
							<li class="list-group-item #(currentSlug EQ 'why-ohme' ? 'active' : '')#" #(currentSlug EQ 'why-ohme' ? 'aria-current="page"' : '')#><a href="/planyourspecialevent/page/why-ohme">Why Ohme</a></li>
							<li class="list-group-item #(currentSlug EQ 'weddings' ? 'active' : '')#" #(currentSlug EQ 'weddings' ? 'aria-current="page"' : '')#><a href="/planyourspecialevent/page/weddings">Weddings</a></li>
							<li class="list-group-item"><a href="https://ohmegardens.tripleseat.com/party_request/20439" target="_blank" rel="noopener noreferrer">Private Events</a></li>
							<li class="list-group-item #(currentSlug EQ 'frequently-asked-questions' ? 'active' : '')#" #(currentSlug EQ 'frequently-asked-questions' ? 'aria-current="page"' : '')#><a href="/planyourspecialevent/frequently-asked-questions">Frequently Asked Questions</a></li>
							<li class="list-group-item #(currentSlug EQ 'photo-gallery' ? 'active' : '')#" #(currentSlug EQ 'photo-gallery' ? 'aria-current="page"' : '')#><a href="/planyourspecialevent/photo-gallery">Photo Gallery</a></li>
						<cfelseif currentSection EQ "getinvolved">
							<li class="list-group-item #(currentSlug EQ 'how-you-can-help' ? 'active' : '')#" #(currentSlug EQ 'how-you-can-help' ? 'aria-current="page"' : '')#><a href="/getinvolved/page/how-you-can-help">How You Can Get Involved</a></li>
							<li class="list-group-item #(currentSlug EQ 'friends-of-ohme' ? 'active' : '')#" #(currentSlug EQ 'friends-of-ohme' ? 'aria-current="page"' : '')#><a href="/getinvolved/page/friends-of-ohme">Ohme Gardens Friends Society</a></li>
							<li class="list-group-item #(currentSlug EQ 'memorials-and-tributes' ? 'active' : '')#" #(currentSlug EQ 'memorials-and-tributes' ? 'aria-current="page"' : '')#><a href="/getinvolved/page/memorials-and-tributes">Memorials and Tributes</a></li>
							<li class="list-group-item #(currentSlug EQ 'adopt-a-bench' ? 'active' : '')#" #(currentSlug EQ 'adopt-a-bench' ? 'aria-current="page"' : '')#><a href="/getinvolved/page/adopt-a-bench">Adopt-a-Bench</a></li>
							<li class="list-group-item #(currentSlug EQ 'donate' ? 'active' : '')#" #(currentSlug EQ 'donate' ? 'aria-current="page"' : '')#><a href="/getinvolved/page/donate">Donate</a></li>
						</cfif>
					</ul>
				</aside>

				<!-- Main Content Column -->
				<div class="col-lg-9">
					<article class="post">

						<!-- Title Header -->
						<h2 class="post-title font-playfair fs-2 text-dark mb-4 pb-2 border-bottom">#EncodeForHTML(content.Title)#</h2>

						<!-- Body Content -->
						<div class="post-entry" id="page-content-body">
							#renderCmsContent(content.Body)#
						</div>

					</article>
				</div>

			</div>
		</div>
	</section>
</div>
</cfoutput>
