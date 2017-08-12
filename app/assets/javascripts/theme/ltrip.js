(function($) {

    "use strict";

/* ...................................................................................
* Adding Class in body
* ....................................................................................*/
jQuery.each( jQuery.browser, function( i, val ) {
    $("body").addClass(i);
});

$(window).on("load", function() {
    var headerHeight = $(".site-branding .container").outerHeight();
    $(".main-menu .sub-menu,.main-menu  .mega-menu").animate({
        paddingTop: headerHeight
    });
    $('.toggle').on('click', function() {
        $('.container').stop().addClass('active');
        });

        $('.close').on('click', function() {
        $('.container').stop().removeClass('active');
    });


    $("#notificationLink").click(function()
			{
			$("#notificationContainer").fadeToggle(300);
			$("#notification_count").fadeOut("slow");
			return false;
			});

			//Document Click hiding the popup 
			$(document).click(function()
			{
			$("#notificationContainer").hide();
			});

			//Popup on click
			$("#notificationContainer").click(function()
			{
			return false;
			});

    $(".modal-fullscreen").on('show.bs.modal', function () {
        setTimeout( function() {
            $(".modal-backdrop").addClass("modal-backdrop-fullscreen");
        }, 0);
        });
        $(".modal-fullscreen").on('hidden.bs.modal', function () {
        $(".modal-backdrop").addClass("modal-backdrop-fullscreen");
    });
    var showRightPush = document.getElementById( 'showRightPush' ),
		body = document.body,
        menuRight = document.getElementById( 'cbp-spmenu-s2' )
        ;
    showRightPush.onclick = function() {
        classie.toggle( this, 'active' );
        classie.toggle( body, 'cbp-spmenu-push-toleft' );
        classie.toggle( menuRight, 'cbp-spmenu-open' );
    };
    $(".main-menu li,.main-menu li .sub-menu").on("hover", function () {
        $(this).children(".sub-menu").stop(true, true).fadeToggle();
        $(this).children(".inner-menu").stop(true, true).fadeToggle();
    });

    $(".main-menu .mega-menu-nav").hover(function () {
        $(this).children(".mega-menu").stop(true, true).fadeIn();
        $(this).children(".mega-menu").css("display", "flex");
    }, function(){
        $(this).children(".mega-menu").stop(true, true).fadeOut();
    });

    $(".header-search").on("hover", function () {
        $(this).children(".search").stop(true, true).slideToggle();
    });

    $(".header-tour-package").on("click", function () {
        $(this).children(".header-tour-listing").stop(true, true).slideToggle();
    });

    if ($(window).width() < 992) {
        $("#adv-search legend").on("click", function () {
            $(".form-wrap").stop(true, true).slideToggle();
        });
    }

    window.onresize = function () {
        if ($(window).width() < 992) {
            $("#adv-search legend").on("click", function () {
                $(".form-wrap").stop(true, true).slideToggle();
            });
        }
    };

    /* ...................................................................................
    * Owl Carousel Functions
    * http://kenwheeler.github.io/slick/
    * ....................................................................................*/
    if(jQuery().slick) {
        // Home page main slider and Tour by destination
        $('.main-slider, .tour-by-destination').slick({
            dots: false,
            infinite: true,
            speed: 500,
            fade: true,
            cssEase: 'linear',
            adaptiveHeight: true,
            prevArrow: '<span class="slick-prev"><i class="fa fa-angle-left"></i></span>',
            nextArrow: '<span class="slick-next"><i class="fa fa-angle-right"></i></span>'
        });

    // Tour Price Carousel
    $('.tour-carousel').slick({
        slidesToShow: 4,
        slidesToScroll: 4,
        dots: false,
        prevArrow: '<span class="slick-prev"><i class="fa fa-angle-left"></i></span>',
        nextArrow: '<span class="slick-next"><i class="fa fa-angle-right"></i></span>',
        responsive: [
        {
            breakpoint: 991,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 3
            }
        },
        {
            breakpoint: 700,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 2
            }
        },
        {
            breakpoint: 500,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }
        ]
    });

    // Partners Carousel
    $('.partners-carousel').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        dots: false,
        arrows: false,
        infinite: true,
        speed: 500,
        autoplay: true,
        adaptiveHeight: true,
        responsive: [
        {
            breakpoint: 991,
            settings: {
                slidesToShow: 3,
                slidesToScroll: 3
            }
        },
        {
            breakpoint: 700,
            settings: {
                slidesToShow: 2,
                slidesToScroll: 2
            }
        },
        {
            breakpoint: 500,
            settings: {
                slidesToShow: 1,
                slidesToScroll: 1
            }
        }
        ]
    });

    $('.tour-single-slider-for').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.tour-single-slider-nav',
        autoplay: true,
        adaptiveHeight: true
    });
    $('.tour-single-slider-nav').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.tour-single-slider-for',
        arrows: false,
        focusOnSelect: true
    });

    }


    /* ...................................................................................
    * Tabs Functions
    * ....................................................................................*/

    $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show')
    });

    /* ...................................................................................
    * Accordion Functions
    * ....................................................................................*/
    $("#accordion .panel-title").click(function(){
        if($(this).hasClass("current")){
            $(this).closest(".panel-heading").removeClass("current");
        }else{
            $(this).closest(".panel-heading").addClass("current");
        }
    });

    /* ...................................................................................
    * Tooltips Functions
    * ....................................................................................*/
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });


    /* ...................................................................................
    * Tooltips Functions
    * ....................................................................................*/


    $('.skillbar').each(function(){
        jQuery(this).find('.skillbar-bar').animate({
            width:jQuery(this).attr('data-percent')
        },2000);
    });


    /* ...................................................................................
    * Tooltips Functions
    * ....................................................................................*/
    if(jQuery().datepicker){
        $('.date-picker')
        .datepicker({
            format: 'mm/dd/yyyy'
        });
    }

    /* ...................................................................................
    * Tooltips Functions
    * ....................................................................................*/
    if(jQuery().select2) {
        $("#adv-search select, .sorting select, #trips_email").select2({
            speed: 400
        });
        window.onresize = function() {

            $("#adv-search select, .sorting select, #trips_email").select2({
                speed: 400
            });
        };
    }

    /* ...................................................................................
    * Tour
    * ....................................................................................*/
    var tourItem =$(".tour-item"),
    layoutLinks= $('.layout-control a'),
    bookingLayout= $('.booking-layout a'),
    listStyle= $('.tour-post'),
    CalLayouts= $('.c-layouts');

    layoutLinks.on('click', function () {
        var targetClass = 'col-xs-' + $(this).data('layout');

        tourItem.removeClass('col-md-4 col-xs-12 col-xs-4 col-md-4 col-sm-6');
        tourItem.addClass(targetClass);

        if (tourItem.hasClass('col-xs-12')) {
            listStyle.addClass('list-style');
        } else {
            listStyle.removeClass('list-style');
        }
        layoutLinks.removeClass('active');
        $(this).addClass('active');
        return false;
    });

    $(".calender-show").on('click', function () {
        var CalClass = $(this).data('layout');
        CalLayouts.removeClass('show');
        $(".calender-layout").addClass(CalClass);
        bookingLayout.removeClass('active');
        $(this).addClass('active');
        return false;
    });

    $(".list-show").on('click', function () {
        var CalClass = $(this).data('layout');
        CalLayouts.removeClass('show');
        $(".calender-listing").addClass(CalClass);
        bookingLayout.removeClass('active');
        $(this).addClass('active');
        return false;
    });


    /* ...................................................................................
    * Advance Search Range Filter
    * ....................................................................................*/
    var sliderRange = $( "#slider-range" );
    if(jQuery().slider) {
        sliderRange.slider({
            range: true,
            min: 0,
            max: 500,
            values: [75, 300],
            slide: function (event, ui) {
                $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
        });
        $("#amount").val("$" + sliderRange.slider("values", 0) +
            " - $" + sliderRange.slider("values", 1));

    }


    /* ...................................................................................
    * Nice Scroll Function
    * http://slicknav.com/
    * ....................................................................................*/

    if(jQuery().slicknav) {
        $('.main-nav .main-menu').slicknav({
            prependTo: ".site-branding",
            allowParentLinks: true
        });
    }

    /* ...................................................................................
    * Google Map
    * ....................................................................................*/

    if($("#location-map").length > 0){

        $(window).on("load", function(){
            var mapOptions = {
                center: { lat: -33.8818464, lng: 151.205348},
                zoom: 18
            };
            var map = new google.maps.Map(document.getElementById('location-map'),  mapOptions);
        });
    }
    });

})(jQuery);



function CustomMarker(latlng, map, url, title, args) {
    this.latlng = latlng;
    this.url = url;
    this.title = title;
    this.map = map;
    this.args = args;
    this.setMap(map);
}

CustomMarker.prototype = new google.maps.OverlayView();
CustomMarker.prototype.draw = function () {
    var self = this;
    var root = this.root;

    // styling
    if (!root) {
        root = this.root = document.createElement('img');
        root.style.position = 'absolute';
        root.style.cursor = 'pointer';
        root.style.border = '1px solid red';
        root.width = '50';
        root.height = '50';
        root.src = encodeURI(this.url.replace(/&amp;/g, '&'));
        var panes = this.getPanes();
        panes.overlayImage.appendChild(root);
    }

    // add infowondow
    var infowindow = new google.maps.InfoWindow({
        content: "<h4>" + this.title + "<h4/>"
    });
    google.maps.event.addDomListener(root, 'click', function() {
        infowindow.open(self.map, self);
    });

    // add position
    var point = this.getProjection().fromLatLngToDivPixel(this.latlng);
    if (point) {
        root.style.left = (point.x - 25) + 'px';
        root.style.top = (point.y - 25) + 'px';
    }
};

CustomMarker.prototype.remove = function () {
    if (this.root) {
        this.root.parentNode.removeChild(this.root);
        this.root = null;
    }
};
CustomMarker.prototype.getPosition = function () {
    return this.latlng;
}
jQuery(document).on('click','[data-toggle*=modal]',function(){
  jQuery('[role*=dialog]').each(function(){
    switch(jQuery(this).css('display')){
      case('block'):{jQuery('#'+jQuery(this).attr('id')).modal('hide'); break;}
    }
  });
});

/*!
 * classie - class helper functions
 * from bonzo https://github.com/ded/bonzo
 * 
 * classie.has( elem, 'my-class' ) -> true/false
 * classie.add( elem, 'my-new-class' )
 * classie.remove( elem, 'my-unwanted-class' )
 * classie.toggle( elem, 'my-class' )
 */

/*jshint browser: true, strict: true, undef: true */

( function( window ) {

'use strict';

// class helper functions from bonzo https://github.com/ded/bonzo

function classReg( className ) {
  return new RegExp("(^|\\s+)" + className + "(\\s+|$)");
}

// classList support for class management
// altho to be fair, the api sucks because it won't accept multiple classes at once
var hasClass, addClass, removeClass;

if ( 'classList' in document.documentElement ) {
  hasClass = function( elem, c ) {
    return elem.classList.contains( c );
  };
  addClass = function( elem, c ) {
    elem.classList.add( c );
  };
  removeClass = function( elem, c ) {
    elem.classList.remove( c );
  };
}
else {
  hasClass = function( elem, c ) {
    return classReg( c ).test( elem.className );
  };
  addClass = function( elem, c ) {
    if ( !hasClass( elem, c ) ) {
      elem.className = elem.className + ' ' + c;
    }
  };
  removeClass = function( elem, c ) {
    elem.className = elem.className.replace( classReg( c ), ' ' );
  };
}

function toggleClass( elem, c ) {
  var fn = hasClass( elem, c ) ? removeClass : addClass;
  fn( elem, c );
}

window.classie = {
  // full names
  hasClass: hasClass,
  addClass: addClass,
  removeClass: removeClass,
  toggleClass: toggleClass,
  // short names
  has: hasClass,
  add: addClass,
  remove: removeClass,
  toggle: toggleClass
};

})( window );

function ajaxindicatorstart(text)
{
	if(jQuery('body').find('#resultLoading').attr('id') != 'resultLoading'){
	jQuery('body').append('<div id="resultLoading" style="display:none"><div><img src="ajax-loader.gif"><div>'+text+'</div></div><div class="bg"></div></div>');
	}

	jQuery('#resultLoading').css({
		'width':'100%',
		'height':'100%',
		'position':'fixed',
		'z-index':'10000000',
		'top':'0',
		'left':'0',
		'right':'0',
		'bottom':'0',
		'margin':'auto'
	});

	jQuery('#resultLoading .bg').css({
		'background':'#000000',
		'opacity':'0.7',
		'width':'100%',
		'height':'100%',
		'position':'absolute',
		'top':'0'
	});

	jQuery('#resultLoading>div:first').css({
		'width': '250px',
		'height':'75px',
		'text-align': 'center',
		'position': 'fixed',
		'top':'0',
		'left':'0',
		'right':'0',
		'bottom':'0',
		'margin':'auto',
		'font-size':'16px',
		'z-index':'10',
		'color':'#ffffff'

	});

    jQuery('#resultLoading .bg').height('100%');
       jQuery('#resultLoading').fadeIn(300);
    jQuery('body').css('cursor', 'wait');
}

function ajaxindicatorstop()
{
    jQuery('#resultLoading .bg').height('100%');
       jQuery('#resultLoading').fadeOut(300);
    jQuery('body').css('cursor', 'default');
}