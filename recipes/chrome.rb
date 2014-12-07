namespace :install do
  desc "Install Google Chrome"
  task :chrome do
    package "libappindicator1"
    url "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
  end
end
