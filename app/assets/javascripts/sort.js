$(function() {
  $(".word").sortable();
  $(".word").disableSelection();
  $(".word").sortable({
      update: function(ev, ui) {
          var updateArray =  $(".word").sortable("toArray").join(",");
          $.cookie("word", updateArray, {expires: 30});
      }       
  });
  if($.cookie("word")) {
      var cookieValue = $.cookie("word").split(",").reverse();
      $.each(
          cookieValue,
          function(index, value) {$('#'+value).prependTo(".word");}
      );
  }
});