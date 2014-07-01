/**
 * Plugins for Salem Witch Trial Papers
 *
 * @author Wayne Graham <wayne.graham@virginia.ed>
 * @date 7/1/2014
 */

$(document).ready(function(){
  $('.fa-paragraph').click(function(event) {
    event.preventDefault();

    var id = "#" + $(this).data('id');
    history.pushState(null, null, id);

    var top = $(this).position().top;
    $('html, body').animate({ scrollTop: top }, 800);
    return false;
  });
});
