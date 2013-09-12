class Phlog < ActiveRecord::Base
  attr_accessible :name, :picture, :remote_picture_url
  # :gallery_id, belongs_to :gallery

  mount_uploader :picture, PictureUploader

  after_save :enqueue_picture

  def picture_name
    File.basename(picture.path || picture.filename) if picture
  end

  def enqueue_picture
    PictureWorker.perform_async(id, key) if key.present?
  end

  class PictureWorker
    include Sidekiq::Worker

    def perform(id, key)
      phlog = Phlog.find(id)
      phlog.key = key
      phlog.remote_picture_url = phlog.picture.direct_fog_url(with_path: true)
      phlog.save!
    end
  end
end
