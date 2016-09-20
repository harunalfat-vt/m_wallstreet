require 'grpc/setting_services_pb'

class SettingServiceImpl < Grpc::SettingService::Service
  def create_setting(setting, _call)
    Grpc::Result.new(
      success: true,
      message: "successfully created #{setting.mid}"
    )
  end

  def update_setting(setting, _call)
    Grpc::Result.new(
      success: true,
      message: "successfully created #{setting.mid}"
    )
  end
end

server = GRPC::RpcServer.new
server.add_http2_port('localhost:50001', :this_port_is_insecure)
server.handle(SettingServiceImpl.new)
server.run_till_terminated
