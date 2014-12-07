namespace :install do
  desc "Install Node.js and npm (packaged with Ubuntu)"
  task :nodejs => :apt_get_update do
    system "sudo apt-get -y install nodejs"
    system "sudo ln -s /usr/bin/nodejs /usr/bin/node"
    system "sudo apt-get -y install npm"
  end
end
