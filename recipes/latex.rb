namespace :install do
  desc "Install LaTeX"
  task :latex do
    install_package "texlive"
    install_package "texlive-latex-extra"  # contains mathastext.sty
    install_package "texlive-math-extra"   # contains stmaryrd.sty

    # Have to use this. Otherwise mathastext.sty can still not be found.
    # sudo apt-get -y install texlive-full
    # sudo apt-get -y install tex-common texlive-base texlive-latex-recommended
  end
end
