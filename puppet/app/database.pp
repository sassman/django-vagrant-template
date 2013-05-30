class app::database {

    # https://forge.puppetlabs.com/puppetlabs/mysql

    class { 'mysql': }
    class { 'mysql::python': }
    class { 'mysql::server':
        config_hash => {
            'root_password' => 'root',
            'bind_address'  => '0.0.0.0',
        }
    }

    mysql::db { 'project_name':
        user     => 'project_name',
        password => 'project_name',
        host     => 'localhost',
        grant    => ['all'],
        charset  => 'utf8',
    }

    database_user { 'root@%':
        password_hash => mysql_password('root'),
        require => Package['mysql-client']
    }
    database_grant { 'root@%': privileges => ['all'] }

}