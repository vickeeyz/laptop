namespace :install do
  desc "Install Erlang"
  task :erlang do
    system "sudo apt-get -y install erlang"
  end
end
