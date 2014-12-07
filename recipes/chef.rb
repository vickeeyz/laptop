namespace :install do
  desc "Install Chef"
  task :chef do
    f = "chefdk_0.3.5-1_amd64.deb"
    system "wget -P /tmp https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/#{f}"
    system "sudo dpkg -i /tmp/#{f}"
  end
end
