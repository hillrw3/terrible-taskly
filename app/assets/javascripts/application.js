//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {

  var links = $('a');
  links.hover(function(){
    $(this).toggleClass('hidden');
  });

  links.on('click',function(){
    $('div').css('background-image', 'url(http://www.reactionface.info/sites/default/files/imagecache/Node_Page/images/4e584a22eddc6c06410053e4.jpg)');
  });

  

});