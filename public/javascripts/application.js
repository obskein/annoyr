// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $('.header').live('click', function() {
    window.location.pathname = '/';
  });
});
