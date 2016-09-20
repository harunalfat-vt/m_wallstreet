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
      message: "successfully updated #{setting.mid}"
    )
  end
end
