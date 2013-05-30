class app::misc {

    package { "sed":
        ensure => installed,
    }

    package { "screen":
        ensure => installed,
    }

    file { "/home/vagrant/.bash_aliases":
        ensure => present,
        mode   => 644,
        owner  => "vagrant",
        group  => "vagrant",
        source => "/vagrant/puppet/files/home/vagrant/.bash_aliases",
    }
}