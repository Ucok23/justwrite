class UploadsController < ApplicationController
  before_action :require_login

  def create
    blob = ActiveStorage::Blob.create_and_upload!(
      io: params[:file],
      filename: params[:file].original_filename,
      content_type: params[:file].content_type
    )

    render json: { url: url_for(blob) }
  end

  private

  def require_login
    unless current_user
      render json: { error: "You must be logged in to upload files." }, status: :unauthorized
    end
  end
end
