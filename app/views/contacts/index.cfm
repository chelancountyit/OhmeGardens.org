<cfoutput>
<div class="main">

	<!-- Header section start -->
	<section class="module-small-2 bg-dark py-5 text-white" style="background-image:url(/images/landing-page-3.jpg); background-size: cover; background-position: center;">
		<div class="container py-3">
			<div class="row justify-content-center">
				<div class="col-12 text-center">
					<h1 class="module-title font-playfair display-4 text-white text-shadow my-4">Contact Us</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- Header section end -->

	<!-- Breadcrumbs start (Bootstrap 5) -->
	<nav aria-label="Breadcrumb" class="container py-3">
		<ol class="breadcrumb font-alt mb-0">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Contact Us</li>
		</ol>
	</nav>
	<!-- Breadcrumbs end -->

	<!-- Content section start -->
	<section class="module-2 pt-0 pb-5">
		<div class="container">
			<div class="row g-4">

				<!-- Contact Details Column -->
				<aside class="col-lg-5 sidebar" aria-label="Contact Information">
					<div class="card border-0 shadow-sm rounded-3 p-4 bg-light">
						<h2 class="font-playfair fs-3 text-dark mb-3">Get In Touch</h2>
						<p class="text-secondary">Have questions about visiting, memberships, or hosting an event? Reach out to us anytime.</p>
						<hr class="my-3">
						<div class="mb-3">
							<strong class="text-dark d-block">Address:</strong>
							<span class="text-secondary">
								#(IsStruct(site) && StructKeyExists(site, "address") && Len(site.address)) ? site.address : "3327 Ohme Road"#<br>
								#(IsStruct(site) && StructKeyExists(site, "city") && Len(site.city)) ? site.city : "Wenatchee"#, 
								#(IsStruct(site) && StructKeyExists(site, "state") && Len(site.state)) ? site.state : "WA"# 
								#(IsStruct(site) && StructKeyExists(site, "zip") && Len(site.zip)) ? site.zip : "98801"#
							</span>
						</div>
						<div class="mb-3">
							<strong class="text-dark d-block">Phone:</strong>
							<a href="tel:#(IsStruct(site) && StructKeyExists(site, 'contact_phone') && Len(site.contact_phone)) ? site.contact_phone : '509-662-5785'#" class="text-decoration-none fw-semibold" style="color: ##1e6b18;">
								#(IsStruct(site) && StructKeyExists(site, "contact_phone") && Len(site.contact_phone)) ? site.contact_phone : "(509) 662-5785"#
							</a>
						</div>
						<div class="mb-3">
							<strong class="text-dark d-block">Email:</strong>
							<a href="mailto:#(IsStruct(site) && StructKeyExists(site, 'contact_email') && Len(site.contact_email)) ? site.contact_email : 'info@ohmegardens.org'#" class="text-decoration-none fw-semibold" style="color: ##1e6b18;">
								#(IsStruct(site) && StructKeyExists(site, "contact_email") && Len(site.contact_email)) ? site.contact_email : "info@ohmegardens.org"#
							</a>
						</div>
						<div>
							<strong class="text-dark d-block">Hours of Operation:</strong>
							<span class="text-secondary">
								#(IsStruct(site) && StructKeyExists(site, "office_hours") && Len(site.office_hours)) ? site.office_hours : "April 15 - October 15: 9:00 AM - 6:00 PM Daily"#
							</span>
						</div>
					</div>
				</aside>

				<!-- Contact Form Column -->
				<div class="col-lg-7">
					<article class="post">
						<h2 class="post-title font-playfair fs-2 text-dark mb-3">Send a Message</h2>
						<div class="post-entry">

							<cfif flashKeyExists("success")>
								<div class="alert alert-success d-flex align-items-center mb-4" role="alert">
									<i class="fa fa-check-circle me-2 fs-5" aria-hidden="true"></i>
									<div><strong>Success!</strong> #flash("success")#</div>
								</div>
							</cfif>
							<cfif flashKeyExists("error")>
								<div class="alert alert-danger d-flex align-items-center mb-4" role="alert">
									<i class="fa fa-exclamation-triangle me-2 fs-5" aria-hidden="true"></i>
									<div><strong>Error:</strong> #flash("error")#</div>
								</div>
							</cfif>

							<form id="contact-form" method="post" action="/contacts/submit" novalidate>
								<!-- Anti-spam honeypot (hidden from human users, excluded from screen readers) -->
								<div style="display:none !important;" aria-hidden="true">
									<label for="contact-website">Leave this field blank</label>
									<input type="text" id="contact-website" name="website" tabindex="-1" autocomplete="off">
								</div>

								<div class="mb-3">
									<label for="cname" class="form-label fw-semibold text-dark">Your Name <span class="text-danger" aria-hidden="true">*</span></label>
									<input type="text" id="cname" class="form-control form-control-lg" name="name" placeholder="Enter your full name" required="required" aria-required="true" autocomplete="name">
								</div>

								<div class="mb-3">
									<label for="cphone" class="form-label fw-semibold text-dark">Phone Number</label>
									<input type="tel" id="cphone" class="form-control form-control-lg" name="phone" placeholder="(509) 555-0123" autocomplete="tel">
								</div>

								<div class="mb-3">
									<label for="cemail" class="form-label fw-semibold text-dark">Email Address <span class="text-danger" aria-hidden="true">*</span></label>
									<input type="email" id="cemail" class="form-control form-control-lg" name="email" placeholder="name@example.com" required="required" aria-required="true" autocomplete="email">
								</div>

								<div class="mb-4">
									<label for="cmessage" class="form-label fw-semibold text-dark">Your Message <span class="text-danger" aria-hidden="true">*</span></label>
									<textarea id="cmessage" class="form-control" rows="6" name="message" placeholder="How can we help you?" required="required" aria-required="true"></textarea>
								</div>

								<button type="submit" class="btn btn-success btn-lg rounded-pill px-4 py-2 fw-semibold shadow-sm" id="cfsubmit">
									Send Message &nbsp;<i class="fa fa-paper-plane" aria-hidden="true"></i>
								</button>
							</form>

						</div>
					</article>
				</div>

			</div>
		</div>
	</section>
</div>
</cfoutput>
