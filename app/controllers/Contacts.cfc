component extends="Controller" {

	function index() {
		pageTitle = "Contact Us | Ohme Gardens";
		metaDesc = "Contact Ohme Gardens: phone, email, address, and online inquiry form.";
		metaKeywords = "contact ohme gardens, phone, email, directions";
		currentSection = "contacts";
		currentSlug = "contacts";

		if (!fileExists(ExpandPath("/app/views/contacts/index.cfm"))) {
			renderView(template="/shared/contact");
		}
	}

	function submit() {
		local.name = StructKeyExists(params, "name") ? Trim(params.name) : "";
		local.email = StructKeyExists(params, "email") ? Trim(params.email) : "";
		local.phone = StructKeyExists(params, "phone") ? Trim(params.phone) : "";
		local.message = StructKeyExists(params, "message") ? Trim(params.message) : "";
		local.honeypot = StructKeyExists(params, "website") ? Trim(params.website) : "";

		if (Len(local.honeypot)) {
			flashInsert(error="Spam submission detected.");
			redirectTo(controller="contacts", action="index");
			return;
		}

		if (!Len(local.name) || !Len(local.email) || !Len(local.message) || !IsValid("email", local.email)) {
			flashInsert(error="Please provide your name, a valid email address, and your message.");
			redirectTo(controller="contacts", action="index");
			return;
		}

		try {
			queryExecute("
				INSERT INTO form_submissions (
					siteid, form_type, submitter_name, submitter_email, submitter_phone,
					message, submission_ip, user_agent, is_processed, createdat, updatedat
				) VALUES (
					:siteid, 'contact', :name, :email, :phone,
					:msg, :ip, :ua, 0, SYSUTCDATETIME(), SYSUTCDATETIME()
				)
			", {
				siteid: { value: 'ohme-gardens', cfsqltype: 'cf_sql_nvarchar' },
				name: { value: local.name, cfsqltype: 'cf_sql_nvarchar' },
				email: { value: local.email, cfsqltype: 'cf_sql_nvarchar' },
				phone: { value: local.phone, cfsqltype: 'cf_sql_nvarchar' },
				msg: { value: local.message, cfsqltype: 'cf_sql_nvarchar' },
				ip: { value: cgi.remote_addr, cfsqltype: 'cf_sql_nvarchar' },
				ua: { value: Left(cgi.http_user_agent, 500), cfsqltype: 'cf_sql_nvarchar' }
			}, { datasource: "ChelanCountyWebsite" });

			flashInsert(success="Thank you for contacting Ohme Gardens! We have received your message and will be in touch soon.");
		} catch (any e) {
			flashInsert(error="An error occurred sending your message. Please call us at (509) 662-5785.");
		}

		redirectTo(controller="contacts", action="index");
	}

}
