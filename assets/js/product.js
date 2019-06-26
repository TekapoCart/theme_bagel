$(function () {
    $(".right").each(function (index, value) {
        $(this).click(function () {
            var idx = ((index + 1) >= $(".right").length) ? 0 : (index + 1);
            $(".figure").css('opacity', 0);
            $(".figure").eq(idx).css('opacity', 1);
        });
    });
    $(".left").each(function (index, value) {
        $(this).click(function () {
            if (index >= 0) {
                $(".figure").css('opacity', 0);
                $(".figure").eq(index - 1).css('opacity', 1);
            }
        });
    });
});