default[:dynamodb][:local][:java][:pkg] = 'java-1.7.0-openjdk.x86_64'
default[:dynamodb][:local][:pkg] = 'dynamodb_local_latest'
default[:dynamodb][:local][:pkg][:url] = 'http://dynamodb-local.s3-website-us-west-2.amazonaws.com/#{node[:dynamodb][:local][:pkg]}'
default[:dynamodb][:local][:dir] = 'dynamodb_local'
default[:dynamodb][:local][:port] = 8001
default[:dynamodb][:local][:java_opts] = '-inMemory -port #{node[:dynamodb][:local][:port]}'
