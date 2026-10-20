component extends="Controller" {

	function index() {
		bannerText = (IsStruct(site) && StructKeyExists(site, "office_hours") && Len(Trim(site.office_hours))) 
			? "Open " & Trim(site.office_hours) 
			: "Open April 15 - October 15";
		pageTitle = "Ohme Gardens";
		metaDesc = "Natural stone pathways traversing hillside gardens, past breathtaking panoramic views, towering cedars and firs, lush foliage, mesmerizing waterfall and tranquil pools.";
		metaKeywords = "ohme gardens, wenatchee gardens, alpine gardens, chelan county";
	}

}
