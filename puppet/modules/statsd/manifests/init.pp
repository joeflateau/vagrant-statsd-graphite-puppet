class statsd {

   package { "nodejs" :
     ensure => "present"
   } ->

   file { "tmp-statsd":
     name     => "/tmp/statsd_0.6.0-1_all.deb",
     source   => "puppet:///modules/statsd/statsd_0.6.0-1_all.deb",
   } ->

   package { "statsd" :
     provider => "dpkg",
     source => "/tmp/statsd_0.6.0-1_all.deb",
     ensure => installed,
   }

}