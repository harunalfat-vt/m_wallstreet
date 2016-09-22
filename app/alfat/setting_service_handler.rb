class SettingServiceHandler
  def create_setting(thrift_setting)
    setting_model = to_setting_model(thrift_setting)
    if setting_model.valid?
      setting_model.save
      Thrift::Result.new(
        success: true,
        message: 'successfully created'
      )
    else
      Thrift::Result.new(
        success: false,
        message: 'failed to create'
      )
    end
  end

  def update_setting(thrift_setting)
    setting_model = find_setting_model(thrift_setting)
    setting_model = update_setting_model(setting_model, thrift_setting)

    if setting_model.valid?
      setting_model.save
      Thrift::Result.new(
        success: true,
        message: 'successfully updated'
      )
    else
      Thrift::Result.new(
        success: false,
        message: 'failed to update'
      )
    end
  end

  private

  def to_setting_model(thrift_setting)
    Setting.new(
      mid: thrift_setting.mid,
      payment_type: thrift_setting.payment_type,
      provider: thrift_setting.provider,
      payout_type: thrift_setting.payout_type,
      begin_date: thrift_setting.begin_date,
      end_date: thrift_setting.end_date
    )
  end

  def find_setting_model(thrift_setting)
    Setting.find_by(
      mid: thrift_setting.mid,
      payment_type: thrift_setting.payment_type,
      provider: thrift_setting.provider
    )
  end

  def update_setting_model(setting_model, thrift_setting)
    setting_model.assign_attributes(
      payout_type: thrift_setting.payout_type,
      begin_date: thrift_setting.begin_date,
      end_date: thrift_setting.end_date
    )
    setting_model
  end
end
