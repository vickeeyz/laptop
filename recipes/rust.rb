namespace :install do
  desc "Install Rust"
  task :rust do
    # http://doc.rust-lang.org/guide.html
    system "curl -s https://static.rust-lang.org/rustup.sh | sudo sh"
  end
end
