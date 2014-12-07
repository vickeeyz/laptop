namespace :install do
  desc "Install Sublime Text 3"
  task :sublime do
    f = "sublime-text_build-3065_amd64.deb"
    system "wget -P /tmp http://c758482.r82.cf2.rackcdn.com/#{f}"
    system "sudo dpkg -i /tmp/#{f}"
  end
end
