(function($){

	/* ---------------------------------------------- /*
	 * Preloader
	/* ---------------------------------------------- */

	$(window).load(function() {
		$('.loader').fadeOut();
		$('.page-loader').delay(100).fadeOut('slow');
	});

	$(document).ready(function() {

		/* ---------------------------------------------- /*
		 * Initialization General Scripts for all pages
		/* ---------------------------------------------- */

		var homeSection = $('.home-section'),
			navbar      = $('.navbar-custom'),
			navHeight   = navbar.height(),
			worksgrid   = $('#works-grid'),
			width       = Math.max($(window).width(), window.innerWidth),
			mobileTest;

		if(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
			mobileTest = true;
		}

		buildHomeSection(homeSection);
		navbarAnimation(navbar, homeSection, navHeight);
		// navbarSubmenu and hoverDropdown disabled to allow native Bootstrap 5 dropdown & mobile behavior:
		// navbarSubmenu(width);
		// hoverDropdown(width, mobileTest);

		$(window).resize(function() {
			var width = Math.max($(window).width(), window.innerWidth);
			buildHomeSection(homeSection);
			// hoverDropdown(width, mobileTest);
		});

		$(window).scroll(function() {
			effectsHomeSection(homeSection, this);
			navbarAnimation(navbar, homeSection, navHeight);
		});

		/* ---------------------------------------------- /*
		 * Home section height
		/* ---------------------------------------------- */

		function buildHomeSection(homeSection) {
			if (homeSection.length > 0) {
				if (homeSection.hasClass('home-full-height')) {
					homeSection.height($(window).height());
				} else {
					homeSection.height($(window).height() * 0.76);
				}
			}
		};

		/* ---------------------------------------------- /*
		 * Home section effects
		/* ---------------------------------------------- */

		function effectsHomeSection(homeSection, scrollTopp) {
			if (homeSection.length > 0) {
				var homeSHeight = homeSection.height();
				var topScroll = $(document).scrollTop();
				if ((homeSection.hasClass('home-parallax')) && ($(scrollTopp).scrollTop() <= homeSHeight)) {
					homeSection.css('top', (topScroll * 0.55));
				}
				if (homeSection.hasClass('home-fade') && ($(scrollTopp).scrollTop() <= homeSHeight)) {
					var caption = $('.caption-content');
					caption.css('opacity', (1 - topScroll/homeSection.height() * 1));
				}
			}
		};

		/* ---------------------------------------------- /*
		 * Intro slider setup
		/* ---------------------------------------------- */

		if( $('.hero-slider').length > 0 ) {
			$('.hero-slider').flexslider( {
				animation: "fade",
				animationSpeed: 1500,
				slideshowSpeed: 15000,
				animationLoop: true,
				prevText: '',
				nextText: '',
				before: function(slider) {
					$('.hs-caption').fadeOut().animate({top:'-80px'},{queue:false, easing: 'swing', duration: 1000});
					slider.slides.eq(slider.currentSlide).delay(1000);
					slider.slides.eq(slider.animatingTo).delay(1000);
				},
				after: function(slider) {
					$('.hs-caption').fadeIn().animate({top:'0'},{queue:false, easing: 'swing', duration: 1000});
				},
				useCSS: true
			});
		};

		/* ---------------------------------------------- /*
		 * Youtube video background
		/* ---------------------------------------------- */

		$(function(){
			$(".video-player").mb_YTPlayer();
		});

		$('#video-play').click(function(event) {
			event.preventDefault();
			if ($(this).hasClass('fa-play')) {
				$('.video-player').playYTP();
			} else {
				$('.video-player').pauseYTP();
			}
			$(this).toggleClass('fa-play fa-pause');
			return false;
		});

		$('#video-volume').click(function(event) {
			event.preventDefault();
			$('.video-player').toggleVolume();
			$(this).toggleClass('fa-volume-off fa-volume-up');
			return false;
		});

		/* ---------------------------------------------- /*
		 * Transparent navbar animation
		/* ---------------------------------------------- */

		function navbarAnimation(navbar, homeSection, navHeight) {
			var topScroll = $(window).scrollTop();
			if (navbar.length > 0 && homeSection.length > 0) {
				if(topScroll >= navHeight) {
					navbar.removeClass('navbar-transparent');
				} else {
					navbar.addClass('navbar-transparent');
				}
			}
			//navbar.addClass('navbar-transparent');
		};

		/* ---------------------------------------------- /*
		 * Navbar submenu
		/* ---------------------------------------------- */

		function navbarSubmenu(width) {
			if (width > 767) {
				$('.navbar-custom .navbar-nav > li.dropdown').hover(function() {
					var MenuLeftOffset  = $('.dropdown-menu', $(this)).offset().left;
					var Menu1LevelWidth = $('.dropdown-menu', $(this)).width();
					if (width - MenuLeftOffset < Menu1LevelWidth * 2) {
						$(this).children('.dropdown-menu').addClass('leftauto');
					} else {
						$(this).children('.dropdown-menu').removeClass('leftauto');
					}
					if ($('.dropdown', $(this)).length > 0) {
						var Menu2LevelWidth = $('.dropdown-menu', $(this)).width();
						if (width - MenuLeftOffset - Menu1LevelWidth < Menu2LevelWidth) {
							$(this).children('.dropdown-menu').addClass('left-side');
						} else {
							$(this).children('.dropdown-menu').removeClass('left-side');
						}
					}
				});
			}
		};

		/* ---------------------------------------------- /*
		 * Navbar hover dropdown on desctop
		/* ---------------------------------------------- */

		function hoverDropdown(width, mobileTest) {
			if ((width > 767) && (mobileTest != true)) {
				$('.navbar-custom .navbar-nav > li.dropdown, .navbar-custom li.dropdown > ul > li.dropdown').removeClass('open');
				var delay = 0;
				var setTimeoutConst;
				$('.navbar-custom .navbar-nav > li.dropdown, .navbar-custom li.dropdown > ul > li.dropdown').hover(function() {
					var $this = $(this);
					setTimeoutConst = setTimeout(function() {
						$this.addClass('open');
						$this.find('.dropdown-toggle').addClass('disabled');
					}, delay);
				},
				function() {
					clearTimeout(setTimeoutConst);
					$(this).removeClass('open');
					$(this).find('.dropdown-toggle').removeClass('disabled');
				});
			} else {
				$('.navbar-custom .navbar-nav > li.dropdown, .navbar-custom li.dropdown > ul > li.dropdown').unbind('mouseenter mouseleave');
				$('.navbar-custom [data-toggle=dropdown]').not('.binded').addClass('binded').on('click', function(event) {
					event.preventDefault();
					event.stopPropagation();
					$(this).parent().siblings().removeClass('open');
					$(this).parent().siblings().find('[data-toggle=dropdown]').parent().removeClass('open');
					$(this).parent().toggleClass('open');
				});
			}
		};

		/* ---------------------------------------------- /*
		 * Navbar collapse on click
		/* ---------------------------------------------- */

		$(document).on('click','.navbar-collapse.in',function(e) {
			if( $(e.target).is('a') && $(e.target).attr('class') != 'dropdown-toggle' ) {
				$(this).collapse('hide');
			}
		});

		/* ---------------------------------------------- /*
		 * Set sections backgrounds
		/* ---------------------------------------------- */

		var module = $('.home-section, .module-2, .module-small-2, .side-image');
		module.each(function(i) {
			if ($(this).attr('data-background')) {
				$(this).css('background-image', 'url(' + $(this).attr('data-background') + ')');
			}
		});

		/* ---------------------------------------------- /*
		 * Portfolio
		/* ---------------------------------------------- */

		var worksgrid_mode;
		if (worksgrid.hasClass('works-grid-masonry')) {
			worksgrid_mode = 'masonry';
		} else {
			worksgrid_mode = 'fitRows';
		}

		worksgrid.imagesLoaded(function() {
			worksgrid.isotope({
				layoutMode: worksgrid_mode,
				itemSelector: '.work-item',
			});
		});

		$('#filters a').click(function() {
			$('#filters .current').removeClass('current');
			$(this).addClass('current');
			var selector = $(this).attr('data-filter');

			worksgrid.isotope({
				filter: selector,
				animationOptions: {
					duration: 750,
					easing: 'linear',
					queue: false
				}
			});

			return false;
		});

		/* ---------------------------------------------- /*
		 * Blog masonry
		/* ---------------------------------------------- */

		$('.post-masonry').imagesLoaded(function() {
			$('.post-masonry').masonry();
		});

		/* ---------------------------------------------- /*
		 * Progress bar animations
		/* ---------------------------------------------- */

		$('.progress-bar').each(function(i) {
			$(this).appear(function() {
				var percent = $(this).attr('aria-valuenow');
				$(this).animate({'width' : percent + '%'});
				$(this).find('span').animate({'opacity' : 1}, 900);
				$(this).find('span').countTo({from: 0, to: percent, speed: 900, refreshInterval: 30});
			});
		});

		$('.count-item').each(function(i) {
			$(this).appear(function() {
				var number = $(this).find('.count-to').data('countto');
				$(this).find('.count-to').countTo({from: 0, to: number, speed: 1200, refreshInterval: 30});
			});
		});

		/* ---------------------------------------------- /*
		 * Testimonials, Post sliders
		/* ---------------------------------------------- */

		if ($('.testimonials-slider').length > 0 ) {
			$('.testimonials-slider').flexslider( {
				animation: "slide",
				smoothHeight: true,
			});
		};

		$('.post-images-slider').flexslider( {
			animation: "slide",
			smoothHeight: true,
		});

		/* ---------------------------------------------- /*
		 * Owl slider
		/* ---------------------------------------------- */

		$('.owl-carousel').each(function(i) {

			// Check items number
			if ($(this).data('items') > 0) {
				items = $(this).data('items');
			} else {
				items = 4;
			}

			// Check pagination true/false
			if (($(this).data('pagination') > 0) && ($(this).data('pagination') == true)) {
				pagination = true;
			} else {
				pagination = false;
			}

			// Check navigation true/false
			if (($(this).data('navigation') > 0) && ($(this).data('navigation') == true)) {
				navigation = true;
			} else {
				navigation = false;
			}

			// Build carousel
			$(this).owlCarousel( {
				navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
				navigation: navigation,
				pagination: pagination,
				paginationSpeed: 400,
				singleItem: false,
				items: items,
				slideSpeed: 300,
				autoPlay: 5000
			});

		});

		/* ---------------------------------------------- /*
		 * Video popup, Gallery
		/* ---------------------------------------------- */

		$('.video-pop-up').magnificPopup({
			type: 'iframe',
		});

		$('a.gallery').magnificPopup({
			type: 'image',
			gallery: {
				enabled: true,
				navigateByImgClick: true,
				preload: [0,1]
			},
			image: {
				titleSrc: 'title',
				tError: 'The image could not be loaded.',
			}
		});
		
		$('.open-popup-link').magnificPopup({
			 items: {
			      src: '#forward-modal',
			      type: 'inline'
			 }
		});
		
		$('.open-privacy-link').magnificPopup({
			 items: {
			      src: '#privacy-modal',
			      type: 'inline'
			 }
		});

		/* ---------------------------------------------- /*
		 * WOW Animation When You Scroll
		/* ---------------------------------------------- */

		wow = new WOW({
			mobile: false
		});
		wow.init();

		/* ---------------------------------------------- /*
		 * Rotate
		/* ---------------------------------------------- */

		$(".rotate").textrotator({
			animation: "dissolve",
			separator: "|",
			speed: 3000
		});

		/* ---------------------------------------------- /*
		 * A jQuery plugin for fluid width video embeds
		/* ---------------------------------------------- */

		$('body').fitVids();

		/* ---------------------------------------------- /*
		 * Scroll Animation
		/* ---------------------------------------------- */

		$('.section-scroll').bind('click', function(e) {
			var anchor = $(this);
			$('html, body').stop().animate({
				scrollTop: $(anchor.attr('href')).offset().top
			}, 1000);
			e.preventDefault();
		});

		/* ---------------------------------------------- /*
		 * Scroll top
		/* ---------------------------------------------- */

		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('.scroll-up').fadeIn();
			} else {
				$('.scroll-up').fadeOut();
			}
		});

		$('a[href="#totop"]').click(function() {
			$('html, body').animate({ scrollTop: 0 }, 'slow');
			return false;
		});

		/* ---------------------------------------------- /*
		 * Subscribe form ajax
		/* ---------------------------------------------- */

		$('#subscription-form').submit(function(e) {

			e.preventDefault();
			var $form           = $('#subscription-form');
			var submit          = $('#subscription-form submit');
			var ajaxResponse    = $('#subscription-response');
			var email           = $('input#semail').val();

			$.ajax({
				type: 'POST',
				url: 'assets/php/subscribe.php',
				dataType: 'json',
				data: {
					email: email
				},
				cache: false,
				beforeSend: function(result) {
					submit.empty();
					submit.append('<i class="fa fa-cog fa-spin"></i> Wait...');
				},
				success: function(result) {
					if(result.sendstatus == 1) {
						ajaxResponse.html(result.message);
						$form.fadeOut(500);
					} else {
						ajaxResponse.html(result.message);
					}
				}
			});

		});

		/* ---------------------------------------------- /*
		 * Google Map
		/* ---------------------------------------------- */

//		var mapLocation = new google.maps.LatLng(47.477550,-120.326893);
//
//		var $mapis = $('#map');
//
//		if ($mapis.length > 0) {
//
//			map = new GMaps({
//				streetViewControl : false,
//				overviewMapControl: false,
//				mapTypeControl: false,
//				zoomControl : false,
//				panControl : false,
//				scrollwheel: false,
//				center: mapLocation,
//				el: '#map',
//				 mapTypeId: "satellite",
//				zoom: 18
//			});
//
//			var image = new google.maps.MarkerImage('/images/map-icon.png',
//				new google.maps.Size(59, 65),
//				new google.maps.Point(0, 0),
//				new google.maps.Point(24, 42)
//			);
//			
//			
//
//			map.addMarker({
//				position: mapLocation,
//				icon: image,
//				title: 'Ohme Gardens',
//				infoWindow: {
//					content: '<h3 style="padding: 0px !important;">Ohme Gardens</h3><p>3327 Ohme Road Wenatchee, WA 98801<br/> Phone: (509) 662-5785 <br/> Website: <a href="http://www.ohmegardens.com">http://www.ohmegardens.com</a></p>'
//				}
//			});
//
//		}
		
		/* ---------------------------------------------- /*
		 * Garden Map
		/* ---------------------------------------------- */

//		var gate = new google.maps.LatLng(47.478550,-120.326893);
//		var vistahouse = new google.maps.LatLng(47.478590,-120.325950);
//		var hobbitbench = new google.maps.LatLng(47.478090,-120.326150);
//		var sylvanpool = new google.maps.LatLng(47.477750,-120.327003);
//		var picturelawn = new google.maps.LatLng(47.4773450,-120.327123);
//		var hiddenpool = new google.maps.LatLng(47.4769050,-120.327323);
//		var ridgepath = new google.maps.LatLng(47.4772050,-120.327423);
//		var twinpool = new google.maps.LatLng(47.4771550,-120.327823);
//		var enchantmentfalls = new google.maps.LatLng(47.4774950,-120.327390);
//		var cactuspoint = new google.maps.LatLng(47.4775350,-120.327590);
//		var lowerlawn = new google.maps.LatLng(47.4775750,-120.327490);
//		var totempole = new google.maps.LatLng(47.4777250,-120.327360);
//		var sunkenlawn = new google.maps.LatLng(47.4778650,-120.327290);
//
//		var $mapis = $('#gardenmap');
//
//		if ($mapis.length > 0) {
//
//			gardenmap = new GMaps({
//				streetViewControl : false,
//				overviewMapControl: false,
//				mapTypeControl: false,
//				zoomControl : false,
//				panControl : true,
//				scrollwheel: false,
//				center: mapLocation,
//				mapType:'HYBRID',
//				el: '#gardenmap',
//				zoom: 19
//			});
//
//			var image = new google.maps.MarkerImage('/images/map-pin.png',
//				new google.maps.Size(59, 65),
//				new google.maps.Point(0, 0),
//				new google.maps.Point(24, 42)
//			);
//
//			gardenmap.addMarker({
//				position: vistahouse,
//				icon: image,
//				title: 'Vista House',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Vista House</h4> <img src="/images/map-of-the-garden-thumb/Bonnie-Richmond~Vista-House2.jpg" /> '
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: hobbitbench,
//				icon: image,
//				title: 'Hobbit Bench',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Hobbit Bench</h4> <img src="/images/map-of-the-garden-thumb/Hobbit-Bench.jpg" />'
//				}
//			});
//
//			gardenmap.addMarker({
//				position: sylvanpool,
//				icon: image,
//				title: 'Sylvan Pool',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Sylvan Pool</h4><img src="/images/map-of-the-garden-thumb/Sylvan-Pool.jpg" />'
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: picturelawn,
//				icon: image,
//				title: 'Picture Lawn',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Picture Lawn</h4> <img src="/images/map-of-the-garden-thumb/Picture-Lawn-Bench.jpg" />'
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: hiddenpool,
//				icon: image,
//				title: 'Hidden Pool',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Hidden Pool</h4> <img src="/images/map-of-the-garden-thumb/Kristi-Nay~Hidden-Pool-Bench.jpg" />'
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: ridgepath,
//				icon: image,
//				title: 'Ridge Path',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Ridge Path</h4> <img src="/images/map-of-the-garden-thumb/Ridge-Path.jpg" />'
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: twinpool,
//				icon: image,
//				title: 'Upper Twin Pool',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Upper Twin Pool</h4> <img src="/images/map-of-the-garden-thumb/Twin-Pools.jpg" />'
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: enchantmentfalls,
//				icon: image,
//				title: 'Enchantment Falls',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Enchantment Falls</h4> <img src="/images/map-of-the-garden-thumb/Enchantment-Falls.jpg" /> <br/><br/> <img src="/images/map-of-the-garden-thumb/Steve-Pagels~Enchantment-Falls.jpg" />'
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: cactuspoint,
//				icon: image,
//				title: 'Cactus Point',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Cactus Point</h4> <img src="/images/map-of-the-garden-thumb/Cactus-Point-Outcrop.jpg" />'
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: lowerlawn,
//				icon: image,
//				title: 'Lower Lawn View',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Lower Lawn View</h4> <img src="/images/map-of-the-garden-thumb/Bonnie-Richmond~Lower-Lawn-View.jpg" />'
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: totempole,
//				icon: image,
//				title: 'Totem Pole Lodge',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Totem Pole Lodge</h4> <img src="/images/map-of-the-garden-thumb/Totem-Pole-Lodge.jpg" />'
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: sunkenlawn,
//				icon: image,
//				title: 'Sunken Wedding Lawn',
//				infoWindow: {
//					content: '<h4 style="margin: 0;">Sunken Wedding Lawn</h4> <img src="/images/map-of-the-garden-thumb/Sunken-Lawn.jpg" />'
//				}
//			});
//			
//			gardenmap.addMarker({
//				position: gate,
//				icon: image,
//				title: 'Gate',
//				infoWindow: {
//					content: '<h3 style="padding: 0px !important;">Ohme Gardens</h3><p>3327 Ohme Road Wenatchee, WA 98801<br/> Phone: (509) 662-5785 <br/> Website: <a href="http://www.ohmegardens.com">http://www.ohmegardens.com</a></p><img src="/images/map-of-the-garden-thumb/gate.jpg" />'
//				}
//			});
//		}
		


	});

})(jQuery);