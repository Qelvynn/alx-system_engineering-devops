# The code will create a file named school inside the /tmp Directory
file { '/tmp/school':
  ensure  => 'file',
  content => 'I love Puppet',
  mode    => '0774',
  owner   => 'www-data',
  group   => 'www-data'
}
