namespace :setting_service_server do
  desc 'Run GRPC Server for SettingServices'
  task :grpc_start, [:port] => [:environment] do |_t, args|
    port = args.port ? args.port : '50001'
    server = GRPC::RpcServer.new
    server.add_http2_port("localhost:#{port}", :this_port_is_insecure)
    server.handle(SettingServiceImpl.new)
    puts "Starting GRPC Server in port #{port}"
    server.run_till_terminated
  end

  desc 'Run Thrift Server for SettingServices'
  task :thrift_start, [:port] => [:environment] do |_t, args|
    port = args.port ? args.port.to_i : '50002'.to_i
    handler = SettingServiceHandler.new
    processor = Thrift::SettingService::Processor.new(handler)
    transport = Thrift::ServerSocket.new(port)
    transport_factory = Thrift::BufferedTransportFactory.new
    server = Thrift::ThreadPoolServer.new(processor, transport,
                                          transport_factory, nil, 3)

    puts "Starting Thrift Server in port #{port}"
    server.serve
  end
end
