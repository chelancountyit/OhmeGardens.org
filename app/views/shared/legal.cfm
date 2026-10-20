<cfoutput>
<div class="main">

	<!-- Header section start -->
	<section class="module-small-2 bg-dark py-5 text-white" style="background-image:url(/images/landing-page-3.jpg); background-size: cover; background-position: center;">
		<div class="container py-3">
			<div class="row justify-content-center">
				<div class="col-12 text-center">
					<h1 class="module-title font-playfair display-4 text-white text-shadow my-4">Legal</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- Header section end -->

	<!-- Breadcrumbs start (Bootstrap 5) -->
	<nav aria-label="Breadcrumb" class="container py-3">
		<ol class="breadcrumb font-alt mb-0">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Privacy Policy &amp; Terms of Use</li>
		</ol>
	</nav>
	<!-- Breadcrumbs end -->

	<!-- Content section start -->
	<section class="module-2 pt-0 pb-5">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<article class="post">
						<h2 class="post-title font-playfair fs-2 text-dark mb-3">Terms of Use &amp; Privacy Policy</h2>
						<div class="post-entry">
							<cfif StructKeyExists(variables, "content") AND isObject(content) AND Len(content.Body)>
								#renderCmsContent(content.Body)#
							<cfelse>
								<p>1. <strong>Acceptance of Terms.</strong> Welcome to this website which is published by the County of Chelan. Use of this website is voluntary. By using this website, you consent to the collection and use of your personally identifiable information (PII) and non-personal information as described in this policy.</p>
								<p>2. <strong>Public Records Act (RCW 42.56).</strong> As a government entity, records maintained by Chelan County are subject to the Washington State Public Records Act. Any information submitted to this site may be subject to public disclosure upon request.</p>
							</cfif>
						</div>
					</article>
				</div>
			</div>
		</div>
	</section>
</div>
</cfoutput>
