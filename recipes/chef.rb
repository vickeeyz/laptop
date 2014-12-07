namespace :install do
  desc "Install Chef"
  task :chef do
    url "https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.5-1_amd64.deb"
  end
end
