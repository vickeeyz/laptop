def install_package(*packages)
  packages.each do |package|
    system "sudo apt-get -y install #{package}"
  end
end

Dir["#{File.dirname(__FILE__)}/recipes/*.rb"].each do |f|
  load f
end
