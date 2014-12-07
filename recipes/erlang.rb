namespace :install do
  desc "Install Erlang"
  task :erlang do
    package "erlang"
  end
end
