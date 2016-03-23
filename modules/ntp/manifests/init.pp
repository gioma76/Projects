class ntp{

 case $operatingsystem {
	'Ubuntu' : {
          $service_name	   = 'ntp'
	  $conf_file	   = 'ntp.conf.erb'
	  $default_servers = [	'0.ubuntu.pool.ntp.org',
				'1.ubuntu.pool.ntp.org',
				'2.ubuntu.pool.ntp.org',	
				'3.ubuntu.pool.ntp.org',]
	}
	
       'redhat' : {
   	  $service_name = 'ntpd'
          $conf_file    = 'ntp.conf.el' 
       } 

 } 

if $servers == undef {

	$servers_real = $default_Servers
}

else {
	$servers_real = $servers

}


	package{ 'ntp':
          ensure => installed,
        }

        service{ 'ntp':
          name		 => $service_name,	
	  ensure         => running,
          enable         => true,
	  subscribe      => File['ntp.conf']
        }

	file {'ntp.conf':
	  path		=> '/etc/ntp.conf',
	  ensure	=> file,
	  require	=> Packages['ntp'],
 	  content 	=> "puppet://ntp/${conf_file}",
	}

}
