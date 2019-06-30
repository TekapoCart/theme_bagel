$(function () {

    $(".right").each(function (index, value) {
        $(this).click(function () {
            var idx = ((index + 1) >= $(".right").length) ? 0 : (index + 1);
            $(".figure").css('opacity', 0).removeClass('current');
            $(".figure").eq(idx).css('opacity', 1).addClass('current');
        });
    });

    $(".left").each(function (index, value) {
        $(this).click(function () {
            if (index >= 0) {
                $(".figure").css('opacity', 0).removeClass('current');
                $(".figure").eq(index - 1).css('opacity', 1).addClass('current');
            }
        });
    });

    $(".figure").first().addClass('current');

    // swiped events
    var swipeable = document.getElementsByClassName("js-swipeable");
    for (var i = 0; i < swipeable.length; i++) {

        // swipeable[i].addEventListener('click', myFunction, false);

        swipeable[i].addEventListener('swiped-left', function(e) {
            $('.figure.current .right').trigger('click');
        });

        swipeable[i].addEventListener('swiped-right', function(e) {
            $('.figure.current .left').trigger('click');
        });
    }

});