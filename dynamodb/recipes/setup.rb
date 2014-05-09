packages = ['#{node[:dynamodb][:local][:java][:pkg]}', 'wget']

packages.each do |pkg|
  package pkg do
    action :install
  end
end

bash 'install dynamodb local' do
  code <<-EOC
    cd ~
    mkdir #{node[:dynamodb][:local][:dir]}
    cd #{node[:dynamodb][:local][:dir]}
    wget #{node[:dynamodb][:local][:pkg][:url]}
    tar xzf #{node[:dynamodb][:local][:pkg]}
    rm #{node[:dynamodb][:local][:pkg]}
    cd ~
  EOC
end

execute 'start dynamodb local' do
  command 'cd ~/#{node[:dynamodb][:local][:dir]} &&
           java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar #{node[:dynamodb][:local][:java_opts]} & &&
           cd ~'
  action :run
end
