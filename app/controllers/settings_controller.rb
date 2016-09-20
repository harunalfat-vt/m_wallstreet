class SettingsController < ApplicationController
  def index
    render locals: { settings: Setting.order(:created_at) }
  end
end
