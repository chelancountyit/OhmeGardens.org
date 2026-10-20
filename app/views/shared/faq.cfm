<cfoutput>
<cfset sectionTitle = "Plan Your Special Event">
<cfset bannerBg = "/images/Plan-Your-Special-Event.jpg">

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
			<li class="breadcrumb-item"><a href="/planyourspecialevent">#EncodeForHTML(sectionTitle)#</a></li>
			<li class="breadcrumb-item active" aria-current="page">Frequently Asked Questions</li>
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
						<li class="list-group-item"><a href="/planyourspecialevent/page/why-ohme">Why Ohme</a></li>
						<li class="list-group-item"><a href="/planyourspecialevent/page/weddings">Weddings</a></li>
						<li class="list-group-item"><a href="https://ohmegardens.tripleseat.com/party_request/20439" target="_blank" rel="noopener noreferrer">Private Events</a></li>
						<li class="list-group-item active" aria-current="page"><a href="/planyourspecialevent/frequently-asked-questions">Frequently Asked Questions</a></li>
						<li class="list-group-item"><a href="/planyourspecialevent/photo-gallery">Photo Gallery</a></li>
					</ul>
				</aside>

				<!-- Main Content Column -->
				<div class="col-lg-8">
					<article class="post">

						<!-- Title Header -->
						<h2 class="post-title font-playfair fs-2 text-dark mb-4 pb-2 border-bottom">Frequently Asked Questions</h2>

						<!-- Body Content (Modern Accordion) -->
						<div class="post-entry" id="page-content-body">
							<cfif StructKeyExists(variables, "content") AND isObject(content) AND Len(content.Body)>
								#renderCmsContent(content.Body)#
							</cfif>
						</div>

					</article>
				</div>

			</div>
		</div>
	</section>
</div>
</cfoutput>
