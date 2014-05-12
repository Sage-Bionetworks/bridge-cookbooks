packages = ["#{node[:dynamodb][:local][:java][:pkg]}"]

packages.each do |pkg|
  package pkg do
    action :install
  end
end

directory "#{node[:dynamodb][:local][:dir]}" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

remote_file "#{node[:dynamodb][:local][:dir]}/#{node[:dynamodb][:local][:pkg]}" do
  source "#{node[:dynamodb][:local][:pkg_url]}"
end

bash "install dynamodb local" do
  user "root"
  code <<-EOC
    cd #{node[:dynamodb][:local][:dir]}
    tar xzf #{node[:dynamodb][:local][:pkg]}
  EOC
end

file "#{node[:dynamodb][:local][:dir]}/#{node[:dynamodb][:local][:pkg]}" do
  action :delete
end

execute "start dynamodb local" do
  command "cd ~/#{node[:dynamodb][:local][:dir]} &&
           java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar #{node[:dynamodb][:local][:java_opts]} &"
  action :run
end
