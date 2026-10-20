<cfif StructKeyExists(variables, "currentSlug") AND variables.currentSlug EQ "map-of-the-gardens">
	<cfinclude template="map.cfm">
<cfelse>
	<cfinclude template="../shared/page.cfm">
</cfif>
