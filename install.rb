require "pathname"

puts "\njQuery, jQuery-UI, and jRails have been installed to:\n  " + (Pathname.getwd + "javascripts")
puts "
Add the following lines to your application.js file:

  //= require <jquery.min>
  //= require <jquery-ui.min>
  //= require <jrails.min>

  // optional:
  //= require <jquery-ui-i18n.min>

(remove the '.min' suffixes to use the unminified versions instead)
"
