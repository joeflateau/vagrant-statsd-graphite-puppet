class statsd {

   package { "nodejs" :
     ensure => "present"
   }

   package { "statsd" :
     provider => "dpkg",
     source => "puppet:///modules/statsd/statsd_0.6.0-1_all.deb",
     ensure => installed,
     require => Package[nodejs],
   }

}