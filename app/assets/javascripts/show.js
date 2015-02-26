$(document).ready(function($) {
  var lastid;
  $(".video").click(function (e) {
    e.preventDefault();
    var url = this.href;
    $("#" + lastid).css("background", "white")
    lastid = $(this).parent().parent().attr('id');
    $("#" + lastid).css("background", "#E0E0E0")
    $("#preview").html('<audio autoplay controls><source src="' + url + '" type="audio/mpeg"></audio>');
  });
});