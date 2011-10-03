$(document).ready(function(){
  $(".example").each(function(){
    var $link = $("<a/>"),
        $icon = $("<span/>"),
        $pre  = $(this).find("pre");
    
    $icon.addClass("ui-icon ui-icon-newwin");
    
    $link.attr("href", $(this).attr("id"));    
    $link.html($icon[0].outerHTML);
    $link.mouseenter(function(){$(this).addClass("ui-state-active");})
    $link.mouseleave(function(){$(this).removeClass("ui-state-active");})
    $link.click(function(event){
      event.preventDefault();
      eval($pre.html());
    });
    
    $(this).addClass("ui-widget ui-widget-content ui-corner-all");
    $(this).find("h2").addClass("ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix");
    $(this).find("h2").append($link);
  });
});
