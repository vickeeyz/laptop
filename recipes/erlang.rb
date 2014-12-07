namespace :install do
  desc "Install Erlang"
  task :erlang do
    install_package "erlang"
  end
end
