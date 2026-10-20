<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="msvalidate.01" content="58C0EBB56FF34375FF16ECF3ACFCF8C9" />
	<meta name="google-site-verification" content="-FA1R0dtcrbcrdLtYacf8AeuV345kPpZmpgXth4VcQ4" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="Chelan County IT">
	<meta name="description" content="#EncodeForHTMLAttribute(metaDesc ?: 'Ohme Gardens County Park - A 9-acre alpine oasis.')#">
	<meta name="keywords" content="#EncodeForHTMLAttribute(metaKeywords ?: 'ohme gardens, wenatchee, alpine gardens, chelan county')#">
	<meta property="og:image" content="/images/facebook-og16x9.jpg">
	<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
	<title>#EncodeForHTML(pageTitle ?: 'Ohme Gardens')#</title>

	<!-- Local Self-Contained Stylesheets (Bootstrap 5.3 + Local Assets) -->
	<link href="/stylesheets/fonts-local.css" rel="stylesheet">
	<link href="/stylesheets/bootstrap5/css/bootstrap.min.css" rel="stylesheet">
	<link href="/stylesheets/simpletextrotator.css" rel="stylesheet">
	<link href="/stylesheets/font-awesome.css" rel="stylesheet">
	<link href="/stylesheets/et-line-font.css" rel="stylesheet">
	<link href="/stylesheets/magnific-popup.css" rel="stylesheet">
	<link href="/stylesheets/flexslider.css" rel="stylesheet">
	<link href="/stylesheets/owl.carousel.css" rel="stylesheet">
	<link href="/stylesheets/animate.css" rel="stylesheet">
	<link href="/stylesheets/style.css" rel="stylesheet">
	<link href="/stylesheets/jbd-templates.css" rel="stylesheet">
	<link href="/stylesheets/ohme-custom.css" rel="stylesheet">

	<!-- Local jQuery -->
	<script src="/javascripts/jquery-2.1.3.min.js"></script>
</head>
<body id="main-container">

<cfset isHomePage = (StructKeyExists(params, "controller") and (params.controller eq "home" or params.controller eq "gardens" and params.action eq "home")) or (StructKeyExists(params, "action") and params.action eq "home")>

<!-- Skip to Main Content (WCAG 2.4.1 Bypass Blocks) -->
<a href="##main-content" class="skip-link visually-hidden-focusable btn btn-primary position-absolute top-0 start-0 m-2 z-3">Skip to main content</a>

<!-- Header Landmark -->
<header role="banner">
	<!-- Navigation start (Bootstrap 5) -->
	<nav class="navbar navbar-expand-lg navbar-dark navbar-custom #(isHomePage ? 'navbar-transparent fixed-top' : 'bg-conifer sticky-top')# font-raleway shadow-sm" aria-label="Main Navigation">
		<div class="container">

			<!-- Brand -->
			<a class="navbar-brand py-1" href="/" aria-label="Ohme Gardens Home">
				<img src="/images/logo-white-2019.png" alt="Ohme Gardens Logo" style="height: 52px; width: auto;" />
			</a>

			<!-- Responsive Toggler (Bootstrap 5) -->
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="##custom-collapse" aria-controls="custom-collapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Collapsible Navigation (Right-Aligned) -->
			<div class="collapse navbar-collapse justify-content-end" id="custom-collapse">

				<div class="d-flex flex-column align-items-lg-end w-100">
					<!-- Desktop Top Bar -->
					<div class="top-bar d-none d-lg-flex justify-content-end align-items-center gap-3 py-1 text-white small">
						<a class="text-white text-decoration-none" href="https://www.instagram.com/ohme.gardens" target="_blank" rel="noopener noreferrer" aria-label="Follow Ohme Gardens on Instagram"><i class="fa fa-instagram" aria-hidden="true"></i></a>
						<a class="text-white text-decoration-none" href="https://twitter.com/ohmegardens" target="_blank" rel="noopener noreferrer" aria-label="Follow Ohme Gardens on Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a>
						<a class="text-white text-decoration-none" href="https://www.facebook.com/ohmegardens" target="_blank" rel="noopener noreferrer" aria-label="Follow Ohme Gardens on Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>

						<span class="text-secondary" aria-hidden="true">|</span>
						<span><i class="fa fa-phone me-1" aria-hidden="true"></i> #(IsStruct(site) && StructKeyExists(site, "contact_phone") && Len(site.contact_phone)) ? site.contact_phone : "1 509 662 5785"#</span>

						<span class="text-secondary" aria-hidden="true">|</span>
						<div class="dropdown d-inline-block">
							<button class="utility-translate-btn dropdown-toggle" type="button" id="translateDropdown" data-bs-toggle="dropdown" aria-expanded="false" aria-controls="translate-listbox" aria-label="Language selection. Current language: English. Choose a language.">
								<img src="/images/us.svg" alt="" class="flag-icon" width="20" height="14" aria-hidden="true">
								<span class="fw-bold">ENGLISH</span>
							</button>
							<ul class="dropdown-menu dropdown-menu-end translate-listbox shadow" id="translate-listbox" aria-label="Choose a language">
								<li><span class="dropdown-item-text text-muted small"><i class="fa fa-spinner fa-spin me-1" aria-hidden="true"></i> Loading languages...</span></li>
							</ul>
						</div>

						<span class="text-secondary" aria-hidden="true">|</span>
						<a class="text-white text-decoration-none fw-bold" href="/getinvolved/page/donate">DONATE</a>
					</div>

					<!-- Main Nav Links (Right-Aligned) - Powered dynamically by CMSAdmin dbo.navigation_menus / navigation_menu_items -->
					<ul class="navbar-nav ms-auto justify-content-end align-items-lg-center pt-lg-2 w-100 nav-menu-list">
						<cfif StructKeyExists(variables, "nav") && IsArray(variables.nav) && ArrayLen(variables.nav)>
							<cfloop array="#variables.nav#" index="item">
								<cfif StructKeyExists(item, "active") && !item.active>
									<cfcontinue>
								</cfif>
								<cfset hasChildren = StructKeyExists(item, "children") && IsArray(item.children) && ArrayLen(item.children)>
								<cfset isContactAction = (FindNoCase("contact", item.label) or FindNoCase("contact", item.url))>

								<cfif hasChildren>
									<li class="nav-item dropdown">
										<a href="#EncodeForHTMLAttribute(item.url)#" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">#EncodeForHTML(item.label)#</a>
										<ul class="dropdown-menu">
											<cfloop array="#item.children#" index="child">
												<cfif !StructKeyExists(child, "active") || child.active>
													<li><a class="dropdown-item" href="#EncodeForHTMLAttribute(child.url)#"<cfif StructKeyExists(child, "newWindow") && child.newWindow> target="_blank" rel="noopener noreferrer"</cfif>>#EncodeForHTML(child.label)#</a></li>
												</cfif>
											</cfloop>
										</ul>
									</li>
								<cfelseif isContactAction>
									<li class="nav-item ms-lg-3 my-2 my-lg-0">
										<a href="#EncodeForHTMLAttribute(item.url)#" class="btn btn-success rounded-pill px-3 py-1 fw-bold"<cfif StructKeyExists(item, "newWindow") && item.newWindow> target="_blank" rel="noopener noreferrer"</cfif>>#EncodeForHTML(item.label)#</a>
									</li>
								<cfelse>
									<li class="nav-item">
										<a class="nav-link" href="#EncodeForHTMLAttribute(item.url)#"<cfif StructKeyExists(item, "newWindow") && item.newWindow> target="_blank" rel="noopener noreferrer"</cfif>>#EncodeForHTML(item.label)#</a>
									</li>
								</cfif>
							</cfloop>
						<cfelse>
							<!-- Fallback Static Nav if database is offline -->
							<li class="nav-item dropdown">
								<a href="/thegardens" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">The Gardens</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="/thegardens/page/the-history-of-ohme-gardens">The History of Ohme Gardens</a></li>
									<li><a class="dropdown-item" href="/thegardens/page/about-us">About Us</a></li>
									<li><a class="dropdown-item" href="/thegardens/photo-gallery">Photo Gallery</a></li>
									<li><a class="dropdown-item" href="/thegardens/page/map-of-the-gardens">Map of the Gardens</a></li>
								</ul>
							</li>
							<li class="nav-item dropdown">
								<a href="/planyourvisit" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">Plan Your Visit</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="/planyourvisit/page/hours-and-admission">Hours and Admissions</a></li>
									<li><a class="dropdown-item" href="/planyourvisit/page/gardens-membership">Memberships</a></li>
									<li><a class="dropdown-item" href="/planyourvisit/page/driving-directions">Directions</a></li>
									<li><a class="dropdown-item" href="/planyourvisit/page/group-rates">Group Rates</a></li>
								</ul>
							</li>
							<li class="nav-item dropdown">
								<a href="/events" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">Events</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="/events/page/comedy-in-the-gardens">Comedy in the Gardens</a></li>
									<li><a class="dropdown-item" href="/events/page/sound-healing--yoga-nidra-at-ohme-gardens">Sound Healing + Yoga Nidra</a></li>
									<li><a class="dropdown-item" href="/events/page/movies-in-the-gardens">Movies in the Gardens</a></li>
									<li><a class="dropdown-item" href="/events/page/gnomes-and-fairies-in-the-gardens">Gnomes and Fairies</a></li>
									<li><a class="dropdown-item" href="/events/page/make-a-difference-day">Make a Difference Day</a></li>
									<li><a class="dropdown-item" href="/events/page/story-hour-in-the-gardens">Story Hour in the Garden</a></li>
									<li><a class="dropdown-item" href="/events/page/roots--rhythm">Roots &amp; Rhythm</a></li>
								</ul>
							</li>
							<li class="nav-item dropdown">
								<a href="/planyourspecialevent" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">Plan Your Special Event</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="/planyourspecialevent/page/why-ohme">Why Ohme</a></li>
									<li><a class="dropdown-item" href="/planyourspecialevent/page/weddings">Weddings</a></li>
									<li><a class="dropdown-item" href="/planyourspecialevent/photo-gallery">Wedding Photo Gallery</a></li>
									<li><a class="dropdown-item" href="https://ohmegardens.tripleseat.com/party_request/20439" target="_blank" rel="noopener noreferrer">Private Events</a></li>
									<li><a class="dropdown-item" href="/planyourspecialevent/frequently-asked-questions">Frequently Asked Questions</a></li>
								</ul>
							</li>
							<li class="nav-item dropdown">
								<a href="/getinvolved" class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false">Get Involved</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="/getinvolved/page/how-you-can-help">How You Can Help</a></li>
									<li><a class="dropdown-item" href="/getinvolved/page/friends-of-ohme">Ohme Gardens Friends Society</a></li>
									<li><a class="dropdown-item" href="/getinvolved/page/memorials-and-tributes">Memorials and Tributes</a></li>
									<li><a class="dropdown-item" href="/getinvolved/page/adopt-a-bench">Adopt-A-Bench</a></li>
									<li><a class="dropdown-item" href="/getinvolved/page/donate">Donate</a></li>
								</ul>
							</li>
							<li class="nav-item ms-lg-3 my-2 my-lg-0">
								<a href="/contacts" class="btn btn-success rounded-pill px-3 py-1 fw-bold">Contact Us</a>
							</li>
						</cfif>
					</ul>

					<!-- Mobile Top Bar Links -->
					<div class="d-lg-none pt-3 pb-2 border-top border-secondary mt-2 text-white small">
						<div class="d-flex gap-3 mb-2">
							<a class="text-white text-decoration-none" href="https://www.instagram.com/ohme.gardens" target="_blank" rel="noopener noreferrer" aria-label="Instagram"><i class="fa fa-instagram"></i></a>
							<a class="text-white text-decoration-none" href="https://twitter.com/ohmegardens" target="_blank" rel="noopener noreferrer" aria-label="Twitter"><i class="fa fa-twitter"></i></a>
							<a class="text-white text-decoration-none" href="https://www.facebook.com/ohmegardens" target="_blank" rel="noopener noreferrer" aria-label="Facebook"><i class="fa fa-facebook"></i></a>
						</div>
						<div class="mb-1"><i class="fa fa-phone me-1"></i> #(IsStruct(site) && StructKeyExists(site, "contact_phone") && Len(site.contact_phone)) ? site.contact_phone : "1 509 662 5785"#</div>
						<div class="dropdown my-2">
							<button class="utility-translate-btn dropdown-toggle d-inline-flex align-items-center gap-1" type="button" id="translateDropdownMobile" data-bs-toggle="dropdown" aria-expanded="false" aria-controls="translate-listbox-mobile" aria-label="Language selection. Current language: English. Choose a language.">
								<img src="/images/us.svg" alt="" class="flag-icon" width="20" height="14" aria-hidden="true">
								<span class="fw-bold">ENGLISH</span>
							</button>
							<ul class="dropdown-menu translate-listbox shadow" id="translate-listbox-mobile" aria-label="Choose a language">
								<li><span class="dropdown-item-text text-muted small"><i class="fa fa-spinner fa-spin me-1"></i> Loading languages...</span></li>
							</ul>
						</div>
						<div><a class="text-white text-decoration-none fw-bold" href="/getinvolved/page/donate">DONATE</a></div>
					</div>

				</div>

			</div>

		</div>
	</nav>
	<!-- Navigation end -->
</header>

<!-- Main Landmark (WCAG 1.3.1 & 2.4.1) -->
<main id="main-content" role="main" tabindex="-1">
	#includeContent()#
</main>

<!-- Scroll-up Button with accessible label -->
<div class="scroll-up">
	<a href="##totop" aria-label="Scroll back to top of page">
		<i class="fa fa-angle-double-up" aria-hidden="true"></i>
	</a>
</div>

<!-- Footer Landmark (WCAG 1.3.1, 1.4.3 AAA Contrast) -->
<footer class="footer bg-dark" role="contentinfo">
	<div class="container py-4">
		<div class="row">
			<div class="col-12 text-center">
				<p class="mb-2">
					<strong class="text-white fs-5">Ohme Gardens</strong> <br/>
					<span class="footer-text">
						#(IsStruct(site) && StructKeyExists(site, "address") && Len(site.address)) ? site.address : "3327 Ohme Road"#, 
						#(IsStruct(site) && StructKeyExists(site, "city") && Len(site.city)) ? site.city : "Wenatchee"# 
						#(IsStruct(site) && StructKeyExists(site, "state") && Len(site.state)) ? site.state : "WA"# 
						#(IsStruct(site) && StructKeyExists(site, "zip") && Len(site.zip)) ? site.zip : "98801"# &bull; 
						#(IsStruct(site) && StructKeyExists(site, "contact_phone") && Len(site.contact_phone)) ? site.contact_phone : "1 509 662 5785"#
					</span>
				</p>
				<p class="copyright mb-0">
					<a href="/legal" class="footer-link">Privacy Policy and Terms of Use</a> 
					<span class="text-secondary mx-1" aria-hidden="true">|</span> 
					<span class="footer-text">&copy; #Year(Now())# <a href="/" class="footer-link">Ohme Gardens</a>. All Rights Reserved.</span>
				</p>
			</div>
		</div>
	</div>
</footer>

<!-- Local Scripts (Bootstrap 5.3 Bundle + Local Helpers) -->
<script src="/stylesheets/bootstrap5/js/bootstrap.bundle.min.js"></script>
<script src="/javascripts/appear.js"></script>
<script src="/javascripts/jquery.simple-text-rotator.min.js"></script>
<script src="/javascripts/jqBootstrapValidation.js"></script>
<script src="/javascripts/isotope.pkgd.min.js"></script>
<script src="/javascripts/imagesloaded.pkgd.js"></script>
<script src="/javascripts/jquery.flexslider-min.js"></script>
<script src="/javascripts/jquery.magnific-popup.min.js"></script>
<script src="/javascripts/jquery.fitvids.js"></script>
<script src="/javascripts/wow.min.js"></script>
<script src="/javascripts/owl.carousel.min.js"></script>
<script src="/javascripts/contact.js"></script>
<script src="/javascripts/custom.js"></script>
<script src="/javascripts/translate.js"></script>
<script src="/javascripts/sharer.js"></script>
<script src="/javascripts/share.js"></script>

<cfif isHomePage>
<script>
// Homepage transparent navbar transition
(function() {
	var nav = document.querySelector('.navbar-custom');
	if (!nav) return;
	function updateNav() {
		if (window.scrollY > 40) {
			nav.classList.remove('navbar-transparent');
		} else {
			nav.classList.add('navbar-transparent');
		}
	}
	window.addEventListener('scroll', updateNav, { passive: true });
	updateNav();
})();
</script>
</cfif>

</body>
</html>
</cfoutput>
