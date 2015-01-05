class statsd {

   package { "nodejs" :
     ensure => "present"
   }

   package { "statsd" :
     provider => "dpkg",
     source => "/tmp/statsd_0.6.0-1_all.deb",
     ensure => installed,
    require  => File[tmp-statsd],
   }

  file { "tmp-statsd":
    name     => "/tmp/statsd_0.6.0-1_all.deb",
    owner    => root,
    group    => root,
    source   => "puppet:///modules/statsd/statsd_0.6.0-1_all.deb",
    require => Package[nodejs],
  }

}