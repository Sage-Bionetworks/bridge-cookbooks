default[:dynamodb][:local][:pkg] = "dynamodb_local_latest"
default[:dynamodb][:local][:pkg_url] = "http://dynamodb-local.s3-website-us-west-2.amazonaws.com/#{node[:dynamodb][:local][:pkg]}"
default[:dynamodb][:local][:dir] = "/opt/dynamodb_local"
default[:dynamodb][:local][:port] = 8001
default[:dynamodb][:local][:java_opts] = "-inMemory -port #{node[:dynamodb][:local][:port]}"
