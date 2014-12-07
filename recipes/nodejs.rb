namespace :install do
  desc "Install Node.js and npm (packaged with Ubuntu)"
  task :nodejs => :apt_get_update do
    package "nodejs"
    system "sudo ln -s /usr/bin/nodejs /usr/bin/node"
    package "npm"
  end
end
