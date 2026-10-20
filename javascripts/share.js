$(document).ready(function() {
	
	  	
	
	  $('#pageUtilities a').tooltip();

	  $('#plus').click(function(){
			curSize= parseInt($('.post-entry').css('font-size')) + 2;
			if(curSize<=20)
				$('.post').css('font-size', curSize);
			});

	  $('#minus').click(function(){
			curSize= parseInt($('.post-entry').css('font-size')) - 2;
			if(curSize>=12)
				$('.post').css('font-size', curSize);
			});

	  $('#print').click(function() {
	  		var pwindow = window.open('', 'Ohme Gardens', 'height=400,width=600');
        	pwindow.document.write('<html><head><title>Ohme Gardens</title>');
        	pwindow.document.write('</head><body >');
        	pwindow.document.write($(".post").html());
        	pwindow.document.write('</body></html>');

        	pwindow.print();
        	pwindow.close();

        	return true;
	  });

	  $("#sendEmail").click(function(event) {
	  		var form_data=$("#send-form").serializeArray();
		    var error_free=true;
		    for (var input in form_data){
		        var element=$("#"+form_data[input]['name']);
		        console.log(element);
		        var valid=element.hasClass("valid");
		        var error_element=$("span", element.parent());
		        if (!valid) {
		        	error_element.removeClass("hide");
		        	error_free=false;
		        } else {
		        	error_element.addClass("hide");
		        }
		    }

		    if (!error_free){
		        event.preventDefault();
		    }
		    else{
		       var robot_police = $("#robotpolice").val().length;
		       var verification = $("#verification").val();

		       if (robot_police > 0 || $.trim(verification) != "hot") {
		       		event.preventDefault();
		       }
		    }
	  });

	  $('#verification').keyup(function(event) {
	     $.validateVerificationElement($(this));
	  });

	  $("#recipientname").keyup(function(event) {
	  	 	$.refreshpreview();
	  });

	   $("#sendername").keyup(function(event) {
	  	 	$.refreshpreview();
	  });

	  $("#recipientemail").keyup(function(event) {
	  		$.validateEmailElement($(this));
	  });

	   $("#senderemail").keyup(function(event) {
	   		$.validateEmailElement($(this));
	  });

	  $('#message').keyup(function(event) {
	  		$.validateEmptyElement($(this));
	  		$.refreshpreview();
	  });
	  
	  
});

$.obscureEmail = function (name,domain) {
	var char = "@abcdefghijklmnopqrstuvwxyz.";
	var user = name.replace(".", char[27]);
	console.log(user);
	var site = domain.replace(".", char[27]);
	
	document.write('<a href=\"mailto:' + user + char[0] + site + '\">');
	document.write(user + '@' + site + '</a>');
};