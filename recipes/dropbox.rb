namespace :install do
  desc "Install Dropbox"
  task :dropbox do
    package "python-gpgme"
    url "https://linux.dropbox.com/packages/ubuntu/dropbox_1.6.2_amd64.deb"

    # Please restart all running instances of Nautilus, or you will experience
    # problems. i.e. nautilus --quit
    system "nautilus --quit"
  end
end
