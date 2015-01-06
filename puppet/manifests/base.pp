class { 'nodejs':
  version => 'stable',
} ->

class { 'graphite' :
    gr_apache_24               => true,
    gr_web_cors_allow_from_all => true,

    gr_storage_schemas         => [
        {
          name       => 'stats',
          pattern    => '.*',
          retentions => '1m:2d,15m:7d,2h:1y'
        }
      ],
} ->

class { 'statsd' :
  backends     => ['./backends/graphite'],
  graphiteHost => 'localhost'
}