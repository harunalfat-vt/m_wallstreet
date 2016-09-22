class SettingServiceImpl < Grpc::SettingService::Service
  def create_setting(setting, call)
    setting_model = to_setting_model(setting)
    if setting_model.valid?
      setting_model.save
      Grpc::Result.new(
        success: true,
        message: 'successfully created'
      )
    else
      Grpc::Result.new(
        success: false,
        message: 'failed to create'
      )
    end

  rescue StandardError => e
    handle_error(e, call)
  end

  def update_setting(setting, call)
    setting_model = find_setting_model(setting)
    setting_model = update_setting_model(setting_model, setting)

    if setting_model.valid?
      setting_model.save
      Grpc::Result.new(
        success: true,
        message: 'successfully updated'
      )
    else
      Grpc::Result.new(
        success: false,
        message: 'failed to update'
      )
    end

  rescue StandardError => e
    handle_error(e, call)
  end

  private

  def to_setting_model(setting)
    Setting.new(
      mid: setting.mid,
      payment_type: setting.payment_type,
      provider: setting.provider,
      payout_type: setting.payout_type,
      begin_date: setting.begin_date,
      end_date: setting.end_date
    )
  end

  def find_setting_model(setting)
    Setting.find_by(
      mid: setting.mid,
      payment_type: setting.payment_type,
      provider: setting.provider
    )
  end

  def update_setting_model(setting_model, setting)
    setting_model.assign_attributes(
      payout_type: setting.payout_type,
      begin_date: setting.begin_date,
      end_date: setting.end_date
    )
    setting_model
  end

  def handle_error(exception, call_view)
    call = call_view.instance_variable_get(:@wrapped)
    status = GRPC::Core::StatusCodes::INTERNAL
    call.send_status(status, exception.message, false)
  end
end
