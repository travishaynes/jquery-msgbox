$(document).ready ->
  $icon = $ "<span/>"
  $icon.addClass "ui-icon ui-icon-newwin"
  
  $(".example").each ->
    $link = $ "<a/>"
    $pre  = $(this).find "pre"
    
    $link.attr "href", $(this).attr "id"
    $link.html $icon.clone()
    
    $link.mouseenter -> $(this).addClass "ui-state-active"
    $link.mouseleave -> $(this).removeClass "ui-state-active"
    
    $link.click ->
      event.preventDefault()
      CoffeeScript.run $pre.text()
    
    $(this).addClass "ui-widget ui-widget-content ui-corner-all"
    $(this).find("h2").addClass "ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix"
    $(this).find("h2").append $link
