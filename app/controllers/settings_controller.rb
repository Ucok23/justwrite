class SettingsController < ApplicationController
  before_action :require_admin

  def edit
    @setting = Setting.instance
  end

  def update
    @setting = Setting.instance
    if @setting.update(setting_params)
      redirect_to edit_settings_path, notice: "Settings updated successfully."
    else
      render :edit
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:allow_sign_up, :default_book_requires_login)
  end
end
