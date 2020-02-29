jQuery(function ($) {
  var commentElement = document.getElementById('comment');
  commentElement.addEventListener('dragstart', function () {
    $(this).scss({
      'color': 'red',
      'font-weight': 'bold'
    });
  }, true);
});
