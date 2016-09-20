namespace :setting_service_server do
  desc 'Run GRPC Server for SettingServices'

  task :start, [:port] => [:environment] do |t, args|
    port = args.port ? args.port : '50001'
    server = GRPC::RpcServer.new
    server.add_http2_port("localhost:#{port}", :this_port_is_insecure)
    server.handle(SettingServiceImpl.new)
    puts 'Starting GRPC Server...'
    server.run_till_terminated
    puts 'Done'
  end
end
