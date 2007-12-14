# Install hook code here
puts "Copying Files."

dir = "javascripts"
["jquery-fx.js", "jquery-ui.js", "jquery.js", "jrails.js"].each do |js_file|
	dest_file = File.join(RAILS_ROOT, "public", dir, js_file)
	src_file = File.join(File.dirname(__FILE__) , dir, js_file)
	FileUtils.cp_r(src_file, dest_file)
end


puts "\nFiles copied. Installation Complete"
