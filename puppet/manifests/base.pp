class { 'graphite' :
    gr_apache_24               => true,
} ->

class { 'statsd' :
  backends     => ['./backends/graphite'],
  graphiteHost => 'localhost',
  flushInterval    => 10000,
  percentThreshold => [75, 90, 99],
}