component extends="Controller" {

	property name="sectionSlug" default="";

	function index() {
		local.section = Len(variables.sectionSlug) ? variables.sectionSlug : LCase(params.controller);
		currentSection = local.section;
		currentSlug = local.section;

		content = model("Page").findOne(
			where="SiteID IN ('ohme-gardens', 'site-ohme-gardens') AND Permalink = '#local.section#' AND StatusCode = 'Active' AND isPublished = 1 AND DeletedAt IS NULL"
		);

		if (isObject(content)) {
			pageTitle = content.Title & " | Ohme Gardens";
			metaDesc = content.MetaDesc ?: "";
			metaKeywords = content.MetaKeyWords ?: "";
		} else {
			pageTitle = capitalizeSection(local.section) & " | Ohme Gardens";
			metaDesc = "Explore " & capitalizeSection(local.section) & " at Ohme Gardens.";
			metaKeywords = "ohme gardens, " & local.section;
		}

		sectionPages = queryExecute("
			SELECT ContentID, Title, Permalink, SortOrder
			FROM dbo.pages
			WHERE SiteID = 'ohme-gardens'
			  AND ParentID = (SELECT TOP 1 ContentID FROM dbo.pages WHERE SiteID = 'ohme-gardens' AND Permalink = :sec)
			  AND StatusCode = 'Active' AND isPublished = 1 AND DeletedAt IS NULL
			ORDER BY SortOrder ASC, Title ASC
		", { sec: { value: local.section, cfsqltype: "cf_sql_nvarchar" } }, { datasource: "ChelanCountyWebsite" });

		if (!fileExists(ExpandPath("/app/views/" & LCase(params.controller) & "/index.cfm"))) {
			renderView(template="/shared/section");
		}
	}

	function page() {
		local.section = Len(variables.sectionSlug) ? variables.sectionSlug : LCase(params.controller);
		local.slug = StructKeyExists(params, "key") ? Trim(params.key) : (StructKeyExists(params, "slug") ? Trim(params.slug) : "");
		local.safeSlug = ReReplace(local.slug, "[^a-zA-Z0-9_-]", "", "all");
		local.singleHyphenSlug = ReReplace(local.safeSlug, "-+", "-", "all");

		content = model("Page").findOne(
			where="SiteID IN ('ohme-gardens', 'site-ohme-gardens') AND Permalink = '#local.safeSlug#' AND StatusCode = 'Active' AND isPublished = 1 AND DeletedAt IS NULL"
		);

		if (!isObject(content) && local.singleHyphenSlug != local.safeSlug) {
			content = model("Page").findOne(
				where="SiteID IN ('ohme-gardens', 'site-ohme-gardens') AND Permalink = '#local.singleHyphenSlug#' AND StatusCode = 'Active' AND isPublished = 1 AND DeletedAt IS NULL"
			);
		}

		if (!isObject(content)) {
			content = model("Page").findOne(
				where="SiteID IN ('ohme-gardens', 'site-ohme-gardens') AND Permalink = '#local.section#-#local.safeSlug#' AND StatusCode = 'Active' AND isPublished = 1 AND DeletedAt IS NULL"
			);
		}

		if (!isObject(content) && local.singleHyphenSlug != local.safeSlug) {
			content = model("Page").findOne(
				where="SiteID IN ('ohme-gardens', 'site-ohme-gardens') AND Permalink = '#local.section#-#local.singleHyphenSlug#' AND StatusCode = 'Active' AND isPublished = 1 AND DeletedAt IS NULL"
			);
		}

		if (!isObject(content)) {
			cfheader(statusCode=404);
			pageTitle = "Page Not Found | Ohme Gardens";
			renderView(template="/shared/notfound");
			return;
		}

		pageTitle = content.Title & " | Ohme Gardens";
		metaDesc = content.MetaDesc ?: "";
		metaKeywords = content.MetaKeyWords ?: "";
		currentSection = local.section;
		currentSlug = local.safeSlug;

		// Sibling pages for sidebar subnav
		subnavPages = queryExecute("
			SELECT ContentID, Title, Permalink, SortOrder
			FROM dbo.pages
			WHERE SiteID IN ('ohme-gardens', 'site-ohme-gardens')
			  AND StatusCode = 'Active' AND isPublished = 1 AND DeletedAt IS NULL
			ORDER BY SortOrder ASC, Title ASC
		", {}, { datasource: "ChelanCountyWebsite" });

		if (fileExists(ExpandPath("/app/views/" & LCase(params.controller) & "/page.cfm"))) {
			renderView(template="/" & LCase(params.controller) & "/page");
		} else if (fileExists(ExpandPath("/app/views/" & LCase(params.controller) & "/pages.cfm"))) {
			renderView(template="/" & LCase(params.controller) & "/pages");
		} else {
			renderView(template="/shared/page");
		}
	}

	function pages() {
		page();
	}

}
