class PhotosController < ApplicationController
  before_action :require_authentication

  def destroy
    @photo = ActiveStorage::Attachment.find(params[:id])
    article = @photo.record

    if article.user == current_user
      @photo.purge

      respond_to do |format|
        format.html { redirect_back(fallback_location: edit_article_path(article), notice: "Фотография успешно удалена") }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_back(fallback_location: root_path, alert: "У вас нет прав на удаление этой фотографии") }
        format.json { head :forbidden }
      end
    end
  end
end
