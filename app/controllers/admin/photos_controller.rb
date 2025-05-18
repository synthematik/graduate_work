class Admin::PhotosController < Admin::BaseController
  def destroy
    @photo = ActiveStorage::Attachment.find(params[:id])
    @photo.purge
    redirect_back(fallback_location: admin_articles_path, notice: "Фото удалено")
  end
end
