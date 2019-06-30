 var backTop = function() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    },
    resizeFooterPos = function() {
        $('#footer').css('visibility', 'hidden').removeClass('sticky');
        if ($('#footer').offset().top + $('#footer').height()  < $(window).height()) {
            $('#footer').addClass('sticky');
        }
        $('#footer').css('visibility', 'visible');
    };

$(function() {

    // back top
    $('.back-top').click(backTop);

    // footer
    resizeFooterPos();
    $(window).resize(resizeFooterPos).trigger("resize");

});