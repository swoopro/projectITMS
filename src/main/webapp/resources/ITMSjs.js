//드랍다운
$('.ui.dropdown').dropdown({
    direction:'auto',
    duration:100,
    onChange:function(value, text, $choice){

    }
});

//좌측,상단 메뉴네비게이션
$("#open_menu").click(function () {
    $('.ui.sidebar').sidebar('setting','transition','overlay').sidebar('toggle');
});


