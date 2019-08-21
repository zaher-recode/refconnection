class CollectionsController < ApplicationController
    def delete_image_attachment
        @image = ActiveStorage::Attachment.find(params[:id])
        @image.purge
        redirect_back(fallback_location: collections_path)
    end
end
