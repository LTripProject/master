(function(jQuery) {

    "use strict";

    /* ...................................................................................
     * Adding Class in body
     * ....................................................................................*/
    jQuery.each( jQuery.browser, function( i, val ) {
        jQuery("body").addClass(i);
    });

    jQuery(window).on("turbolinks:load", function() {
        var headerHeight = jQuery(".site-branding .container").outerHeight();
        jQuery(".main-menu .sub-menu,.main-menu  .mega-menu").animate({
            paddingTop: headerHeight
        });

        jQuery(".main-menu li,.main-menu li .sub-menu").on("hover", function () {
            jQuery(this).children(".sub-menu").stop(true, true).fadeToggle();
            jQuery(this).children(".inner-menu").stop(true, true).fadeToggle();
        });

        jQuery(".main-menu .mega-menu-nav").hover(function () {
            jQuery(this).children(".mega-menu").stop(true, true).fadeIn();
            jQuery(this).children(".mega-menu").css("display", "flex");
        }, function(){
            jQuery(this).children(".mega-menu").stop(true, true).fadeOut();
        });

        jQuery(".header-search").on("hover", function () {
            jQuery(this).children(".search").stop(true, true).slideToggle();
        });

        jQuery(".header-tour-package").on("click", function () {
            jQuery(this).children(".header-tour-listing").stop(true, true).slideToggle();
        });

        if (jQuery(window).width() < 992) {
            jQuery("#adv-search legend").on("click", function () {
                jQuery(".form-wrap").stop(true, true).slideToggle();
            });
        }

        window.onresize = function () {
            if (jQuery(window).width() < 992) {
                jQuery("#adv-search legend").on("click", function () {
                    jQuery(".form-wrap").stop(true, true).slideToggle();
                });
            }
        };
    });

    /* ...................................................................................
     * Owl Carousel Functions
     * http://kenwheeler.github.io/slick/
     * ....................................................................................*/
    if(jQuery().slick) {

        // Home page main slider and Tour by destination
        jQuery('.main-slider, .tour-by-destination').slick({
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
        jQuery('.tour-carousel').slick({
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
        jQuery('.partners-carousel').slick({
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

        jQuery('.tour-single-slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: '.tour-single-slider-nav',
            autoplay: true,
            adaptiveHeight: true
        });
        jQuery('.tour-single-slider-nav').slick({
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

    jQuery('#myTab a').click(function (e) {
        e.preventDefault();
        jQuery(this).tab('show')
    });

    /* ...................................................................................
     * Accordion Functions
     * ....................................................................................*/
    jQuery("#accordion .panel-title").click(function(){
        if(jQuery(this).hasClass("current")){
            jQuery(this).closest(".panel-heading").removeClass("current");
        }else{
            jQuery(this).closest(".panel-heading").addClass("current");
        }
    });

    /* ...................................................................................
     * Tooltips Functions
     * ....................................................................................*/
    jQuery(function () {
        jQuery('[data-toggle="tooltip"]').tooltip()
    });


    /* ...................................................................................
     * Tooltips Functions
     * ....................................................................................*/


    jQuery('.skillbar').each(function(){
        jQuery(this).find('.skillbar-bar').animate({
            width:jQuery(this).attr('data-percent')
        },2000);
    });


    /* ...................................................................................
     * Tooltips Functions
     * ....................................................................................*/
    if(jQuery().datepicker){
        jQuery('.date-picker')
            .datepicker({
                format: 'mm/dd/yyyy'
            });
    }

    /* ...................................................................................
     * Tooltips Functions
     * ....................................................................................*/
    if(jQuery().select2) {
        jQuery("#adv-search select, .sorting select").select2({
            speed: 400
        });
        window.onresize = function() {

            jQuery("#adv-search select, .sorting select").select2({
                speed: 400
            });
        };
    }

    /* ...................................................................................
     * Tour
     * ....................................................................................*/
    var tourItem =jQuery(".tour-item"),
        layoutLinks= jQuery('.layout-control a'),
        bookingLayout= jQuery('.booking-layout a'),
        listStyle= jQuery('.tour-post'),
        CalLayouts= jQuery('.c-layouts');

    layoutLinks.on('click', function () {
        var targetClass = 'col-xs-' + jQuery(this).data('layout');

        tourItem.removeClass('col-md-4 col-xs-12 col-xs-4 col-md-4 col-sm-6');
        tourItem.addClass(targetClass);

        if (tourItem.hasClass('col-xs-12')) {
            listStyle.addClass('list-style');
        } else {
            listStyle.removeClass('list-style');
        }
        layoutLinks.removeClass('active');
        jQuery(this).addClass('active');
        return false;
    });

    jQuery(".calender-show").on('click', function () {
        var CalClass = jQuery(this).data('layout');
        CalLayouts.removeClass('show');
        jQuery(".calender-layout").addClass(CalClass);
        bookingLayout.removeClass('active');
        jQuery(this).addClass('active');
        return false;
    });

    jQuery(".list-show").on('click', function () {
        var CalClass = jQuery(this).data('layout');
        CalLayouts.removeClass('show');
        jQuery(".calender-listing").addClass(CalClass);
        bookingLayout.removeClass('active');
        jQuery(this).addClass('active');
        return false;
    });


    /* ...................................................................................
     * Advance Search Range Filter
     * ....................................................................................*/
    var sliderRange = jQuery( "#slider-range" );
    if(jQuery().slider) {
        sliderRange.slider({
            range: true,
            min: 0,
            max: 500,
            values: [75, 300],
            slide: function (event, ui) {
                jQuery("#amount").val("jQuery" + ui.values[0] + " - jQuery" + ui.values[1]);
            }
        });
        jQuery("#amount").val("jQuery" + sliderRange.slider("values", 0) +
        " - jQuery" + sliderRange.slider("values", 1));

    }


    /* ...................................................................................
     * Nice Scroll Function
     * http://slicknav.com/
     * ....................................................................................*/

    if(jQuery().slicknav) {
        jQuery('.main-nav .main-menu').slicknav({
            prependTo: ".site-branding",
            allowParentLinks: true
        });
    }

  



})(jQuery);

