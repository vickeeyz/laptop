namespace :install do
  desc "Install Node.js and npm (packaged with Ubuntu)"
  task :nodejs => :apt_get_update do
    install_package "nodejs"
    system "sudo ln -s /usr/bin/nodejs /usr/bin/node"
    install_package "npm"
  end
end
