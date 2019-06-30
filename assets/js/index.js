const squareLength = 300,
    chevronWidth = 32,
    navWidth = $('#nav').width(),
    footerWidth = $('#right-bar').width(),

    featuredProductsId = 'home-featuredproducts',
    featuredProductsEl = $('#' + featuredProductsId),
    featuredProductsListingEl = $('#' + featuredProductsId + ' .listing'),
    featuredProductsPrevClass = '#' + featuredProductsId + ' .left',
    featuredProductsNextClass = '#' + featuredProductsId + ' .right',
    featuredProductsChevronClass = '#' + featuredProductsId + ' .chevron',

    homeBannerId = 'home-banner',
    homeBannerEl = $('#' + homeBannerId),
    homeBannerBgClass= '.bg',
    homeBannerBgEl = $(homeBannerBgClass, homeBannerEl),

    imageslidersId = 'imagesliders',
    imageslidersEl = $('#' + imageslidersId),
    imageslidersBgClass = '.bg',
    imageslidersBgEl = $(imageslidersBgClass, imageslidersEl),
    imageslidersPagerId = 'imagesliders-pager',
    imageslidersPagerEl = $('#' + imageslidersPagerId),
    imageslidersPagerChevronClass = '#' + imageslidersPagerId + ' .chevron',
    imagesliderIdPrefix = 'imageslider-';

var featuredProductsCount,
    featuredProductsShuffle = function() {
        $.each(featuredProductsListingEl.get(), function(index, el) {
            var $el = $(el),
                $find = $el.children();
            $find.sort(function() {
                return 0.5 - Math.random();
            });
            $el.empty();
            $find.appendTo($el);
        });
    },
    initFeaturedProducts = function() {

        var availListingWidth,
            sideSpacing;

        if (window.innerWidth <= 767) {
            availListingWidth = squareLength,
                featuredProductsCount = 1,
                sideSpacing = parseInt( ($(window).width() - availListingWidth) / 2);

            featuredProductsEl.css('padding-left', sideSpacing);
            $(featuredProductsPrevClass).css('left', 0).show();
            $(featuredProductsNextClass).css('right', 0).show();
        } else {
            availListingWidth = $(window).width() - navWidth - footerWidth - chevronWidth * 2,
                featuredProductsCount = parseInt(availListingWidth / squareLength),
                sideSpacing = parseInt((availListingWidth - featuredProductsCount * squareLength + chevronWidth * 2 ) / 2);

            featuredProductsEl.css('padding-left', (sideSpacing + navWidth));
            $(featuredProductsPrevClass).css('left', (navWidth + chevronWidth)).show();
            $(featuredProductsNextClass).css('right', (footerWidth + chevronWidth)).show();
        }

        featuredProductsListingEl.on('cycle-initialized', function( event, opts ) {
            $(this).css('visibility', 'visible');
        });

        featuredProductsListingEl.cycle({
            fx: 'carousel',
            timeout: 0,
            allowWrap: false,
            carouselVisible: featuredProductsCount,
            prev: featuredProductsPrevClass,
            next: featuredProductsNextClass,
            slides: 'article'
        });

        changeFeaturedProductsCaption();
    },
    changeFeaturedProductsCaption = function () {
        $('.cycle-slide h3').css('opacity', 0);
        var element = $('.cycle-slide-active');
        for (var i = 0; i < featuredProductsCount; i++) {
            element.find('h3').css('opacity', 1);
            element = element.next();
        }
    },

////////////////////////////////////////////////////////////////////////////////////////////////////////

    resizeImageslidersBg = function() {
        if (window.innerWidth <= 767) {
            imageslidersBgEl.height($(window).height() - squareLength);
        } else {
            imageslidersBgEl.height($(window).height());
        }

        if (homeBannerEl.length) {
            if (window.innerWidth <= 767) {
                homeBannerBgEl.height($(window).height() - squareLength);
            } else {
                homeBannerBgEl.height($(window).height());
            }
        }

    },
    initImageslidersPager = function() {
        if (homeBannerEl.length) {
            $('ul', imageslidersPagerEl).append('<li data-id="' + homeBannerId + '"><span></span></li>');
        }
        if (featuredProductsEl.length) {
            $('ul', imageslidersPagerEl).append('<li data-id="' + featuredProductsId + '"><span></span></li>');
        }
        for (var i = 0; i < $('section', imageslidersEl).length; i++) {
            $('ul', imageslidersPagerEl).append('<li data-id="' + imagesliderIdPrefix + (i + 1)  + '"><span></span></li>');
        }
        $('li', imageslidersPagerEl).first().addClass('current');
        $(homeBannerBgClass, '#' + $('li', imageslidersPagerEl).first().attr('data-id')).addClass('current');
    },
    changeImageslidersBg = function() {
        var sliderTop = parseInt($(window).height() - ($(window).height()/2 - featuredProductsEl.height() / 2), 10),
            sliderHeight = featuredProductsEl.height(),
            windowHeight = $(window).height(),
            bgPos = 0;
        bgOffset = 0;

        if ($(window).scrollTop() < sliderTop) {
            scrollTop = $(this).hasClass('up') ? 0 : sliderTop;
        } else if ($(window).scrollTop() == sliderTop) {
            scrollTop = $(this).hasClass('up') ? 0 : windowHeight + sliderHeight;
        } else if ($(window).scrollTop() < windowHeight + sliderHeight) {
            scrollTop = $(this).hasClass('up') ? sliderTop : windowHeight + sliderHeight;
        } else {

            bgPos = ($(window).scrollTop() - sliderHeight) / windowHeight;
            bgOffset = Math.floor(bgPos);
            if (bgPos == bgOffset) {
                scrollTop = $(this).hasClass('up') ? windowHeight * (bgOffset - 1) : windowHeight * (bgOffset + 1);
                scrollTop += sliderHeight;
                if (bgOffset == 1) {
                    scrollTop = $(this).hasClass('up') ? sliderTop : scrollTop;
                }
            } else {
                scrollTop = $(this).hasClass('up') ? windowHeight * bgOffset : windowHeight * (bgOffset + 1);
                scrollTop += sliderHeight;
            }
        }

        if (scrollTop >= $(document).height()) {
            return false;
        }

        $('li', imageslidersPagerEl).removeClass('current');
        homeBannerBgEl.removeClass('current');
        imageslidersBgEl.removeClass('current');

        if (scrollTop == featuredProductsEl.offset().top - (($(window).height() - featuredProductsEl.height()) / 2)) {
            $('li[data-id="' + featuredProductsId + '"]', imageslidersPagerEl).addClass('current');
        } else if (scrollTop == homeBannerEl.offset().top) {
            $('li[data-id="' + homeBannerId + '"]', imageslidersPagerEl).addClass('current');
            $(homeBannerBgClass, '#' + homeBannerId).addClass('current');
        } else {
            $.each($('section', '#' + imageslidersId).get(), function(index, el) {
                var $el = $(el),
                    sectionId = $el.attr('id');
                if (scrollTop == $('#' + sectionId).offset().top) {
                    $('li[data-id="' + sectionId + '"]', imageslidersPagerEl).addClass('current');
                    $(imageslidersBgClass, '#' + sectionId).addClass('current');
                }
            });
        }

        window.scrollTo(0, scrollTop);
        return false;
    };

$(function() {

    // featured products (ps_featuredproducts)
    featuredProductsShuffle();
    initFeaturedProducts();
    $(featuredProductsChevronClass).click(changeFeaturedProductsCaption);

    // image sliders (ps_imageslider)
    $(window).resize(resizeImageslidersBg).trigger("resize");
    initImageslidersPager();
    $(imageslidersPagerChevronClass).click(changeImageslidersBg);

    $('li', imageslidersPagerEl).click(function() {

        var sectionId = $(this).attr('data-id');

        $('li', imageslidersPagerEl).removeClass('current');
        homeBannerBgEl.removeClass('current');
        imageslidersBgEl.removeClass('current');

        $(this).addClass('current');

        if (sectionId == featuredProductsId) {
            var spacing = ($(window).height() - featuredProductsEl.height()) / 2;
            window.scrollTo(0, $('#' + sectionId).offset().top - spacing);
            return;
        } else if (sectionId == homeBannerId) {
            $(homeBannerBgClass, '#' + sectionId).addClass('current');
        } else {
            $(imageslidersBgClass, '#' + sectionId).addClass('current');
        }

        window.scrollTo(0, $('#' + sectionId).offset().top);
    });

    //
    // $('#greetingDialog').modal();

    // swiped events
    var swipeable = document.getElementsByClassName("js-swipeable");
    for (var i = 0; i < swipeable.length; i++) {

        swipeable[i].addEventListener('swiped-left', function(e) {
            $(featuredProductsNextClass).trigger('click');
        });

        swipeable[i].addEventListener('swiped-right', function(e) {
            $(featuredProductsPrevClass).trigger('click');
        });
    }


});