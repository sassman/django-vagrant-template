class app::appserver {

    # https://forge.puppetlabs.com/puppetlabs/apt
    class { 'apt':
        always_apt_update    => true,
        purge_sources_list   => false,
        purge_sources_list_d => false,
        purge_preferences_d  => false
    }

    # python packages
    package { "python":             ensure => present }
    package { "python-dev":         ensure => present }
    package { "python-setuptools":  ensure => present }
    package { "python-pip":         ensure => present }
    package { "python-virtualenv":  ensure => present }

    # building python modules
    package { "build-essential":    ensure => present }
    package { "gcc":                ensure => present }
    package { "libevent1-dev":      ensure => present }
    package { "git":                ensure => present }

    # stuff for image processing
    package { "libpng12-dev":       ensure => present }
    package { "libjpeg-dev":        ensure => present }
    package { "libjpeg62-dev":      ensure => present }
    package { "zlib1g-dev":         ensure => present }
    package { "libfreetype6-dev":   ensure => present }
    package { "liblcms1-dev":       ensure => present }

    exec { "apt-update":
        command => "apt-get update",
        path    => ["/usr/bin"]
    }

    exec { "pip-requirements":
        path    => ["/usr/bin"],
        command => "pip install -vvv -r /vagrant/requirements.txt",
        timeout => 0,
        require => [
            Package["python"],
            Package["python-dev"],
            Package["python-setuptools"],
            Package["python-pip"],
            Package["python-virtualenv"],
            Package["build-essential"],
            Package["gcc"],
            Package["libevent1-dev"],
            Package["git"],
            Package["libfreetype6-dev"],
            Package["liblcms1-dev"],
            Package["zlib1g-dev"],
            Package["libpng12-dev"],
            Package["libjpeg-dev"],
            Package["libjpeg62-dev"],
        ],
    }

    Exec["apt-update"] -> Package <| |>

    # fixes for pil
    # sudo ln -s /usr/lib/x86_64-linux-gnu/libfreetype.so /usr/lib/
    file { "/usr/lib/libfreetype.so":
        ensure => 'link',
        target => '/usr/lib/x86_64-linux-gnu/libfreetype.so',
    }
    # sudo ln -s /usr/lib/x86_64-linux-gnu/libz.so /usr/lib/
    file { "/usr/lib/libz.so":
        ensure => 'link',
        target => '/usr/lib/x86_64-linux-gnu/libz.so',
    }
    # sudo ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib/
    file { "/usr/lib/libjpeg.so":
        ensure => 'link',
        target => '/usr/lib/x86_64-linux-gnu/libjpeg.so',
    }

}