VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Use Ubuntu 14.04 Trusty Tahr 32-bit as our operating system
  config.vm.box = "ubuntu/trusty32"

  config.vm.provider :virtualbox do |vb|
    # Optimizing memory and CPU
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    # Optimizing network
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    # Setting a nicer name for the box
    vb.name = 'loi_server'
  end
  
  # Forward the Rails server default port to the host
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :private_network, ip: "192.168.56.200"
  # Optimize performance: Use NFS for folder sync
  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  
  vm_ruby_version = '2.1.5' # 2.1.1 was not compiling on Ubuntu
  vm_rbenv_path = '~/.rbenv'
  script = <<-END
    sudo ethtool -s eth0 speed 100 autoneg on duplex full
    sudo sh -c "echo 'deb http://dl.google.com/linux/deb/ stable main' > /etc/apt/sources.list.d/chrome.list"
    sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo apt-get update
    sudo apt-get -y install vim git-core curl zlib1g-dev build-essential module-assistant\
     libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev \
     libxslt1-dev libcurl4-openssl-dev python-software-properties openssl \
     libreadline6-dev postgresql-contrib postgresql-9.3 libpq-dev postgresql-common \
     xvfb qt5-default libqt5webkit5-dev \
     imagemagick \
     google-chrome-stable
    (sudo -u postgres psql postgres -c "SELECT * FROM pg_user WHERE usename like 'vagrant'" | grep 'vagrant') || sudo -u postgres createuser vagrant -s
    if [ ! -d #{vm_rbenv_path} ]; then
      git clone git://github.com/sstephenson/rbenv.git #{vm_rbenv_path}
      echo 'export PATH=#{vm_rbenv_path}/bin:$PATH' >> ~/.bashrc
      echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    fi
    if [ ! -d #{vm_rbenv_path}/plugins/ruby-build ]; then
      git clone git://github.com/sstephenson/ruby-build.git #{vm_rbenv_path}/plugins/ruby-build
      echo 'export PATH=#{vm_rbenv_path}/plugins/ruby-build/bin:$PATH' >> ~/.bashrc
    fi
    echo 'export RAILS_ENV=development' >> ~/.bashrc
    echo 'export RACK_ENV=development' >> ~/.bashrc
    echo 'export PORT=3000' >> ~/.bashrc
    source ~/.bashrc
    #{vm_rbenv_path}/bin/rbenv versions | grep #{vm_ruby_version} || #{vm_rbenv_path}/bin/rbenv install #{vm_ruby_version} && #{vm_rbenv_path}/bin/rbenv global #{vm_ruby_version}
    #{vm_rbenv_path}/bin/rbenv rehash
    echo "gem: --no-ri --no-rdoc" > ~/.gemrc
    #{vm_rbenv_path}/shims/gem install bundler
    #{vm_rbenv_path}/bin/rbenv rehash
    cd /vagrant
    #{vm_rbenv_path}/shims/bundle
    #{vm_rbenv_path}/bin/rbenv rehash
    #{vm_rbenv_path}/shims/rake db:setup
  END
  config.vm.provision "shell", inline: script, privileged: false

end