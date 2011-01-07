namespace :jrails do

	namespace :js do
    desc 'Remove the prototype / script.aculo.us javascript files'
    task :scrub do
      puts "Removing files..."
      files = %W[controls.js dragdrop.js effects.js prototype.js]
      project_dir = File.join(Rails.root, 'public', 'javascripts')
      files.each do |fname|
        FileUtils.rm(File.join(project_dir, fname)) if File.exists?(File.join(project_dir, fname))
      end
      puts "files removed successfully."
    end
  end
  
end
