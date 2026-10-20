(function($){

	$(document).ready(function() {

		/* ---------------------------------------------- /*
		 * Contact form ajax
		/* ---------------------------------------------- */

		$('#contact-form').find('input,textarea').jqBootstrapValidation({
			preventSubmit: true,
			submitError: function($form, event, errors) {
				// additional error messages or events
			},
			submitSuccess: function($form, event) {
				event.preventDefault();

				var submit          = $('#submit');
				var ajaxResponse    = $('#contact-response');

				var cname            = $("#cname").val();
				var cphone           = $("#cphone").val();
				var cemail           = $("#cemail").val();
				var cmessage         = $("#cmessage").val();
				var cverification    = $("#cverification").val();
				

				$.ajax({
					type: 'POST',
					url: '/contacts/submit-form',
					dataType: 'json',
					data: {
						name: cname,
						phone: cphone,
						email: cemail,
						message: cmessage,
						verification: cverification,
					},
					cache: false,
					beforeSend: function() {
						submit.empty();
						submit.append('<i class="fa fa-cog fa-spin"></i> Wait...');
					},
					success: function(result) {
						if(result[0].sendstatus == 1) {
							ajaxResponse.html(result[0].message);
						} else if (result[0].sendstatus == 99) {
							$("#cverification").focus();
							ajaxResponse.html(result[0].message);	
						} else {
							$form.trigger('reset');
							ajaxResponse.html(result[0].message);
						}
						submit.empty();
						submit.append('Submit');
						setTimeout(function(){ ajaxResponse.html("") }, 5000);
						
					}
				});
			}
		});

	});

})(jQuery);