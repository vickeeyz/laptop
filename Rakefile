def url(*urls)
  urls.each do |url|
    filename = url[url.rindex("/")+1..-1]
    system "rm -f /tmp/#{filename}"
    system "wget -P /tmp #{url}"
    system "sudo dpkg -i /tmp/#{filename}"
  end
end

def install_package(*packages)
  packages.each do |package|
    system "sudo apt-get -y install #{package}"
  end
end

Dir["#{File.dirname(__FILE__)}/recipes/*.rb"].each do |f|
  load f
end
