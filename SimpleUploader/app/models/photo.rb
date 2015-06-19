class Photo < ActiveRecord::Base
  has_attached_file :image,
                    #url: "/system/:hash.:extension",
                    #hash_secret: "abc123",
                    #preserve_files: "true",
                    styles: { thumb: "64x64#" },
                    storage: :s3,
                    s3_credentials: {access_key_id: ENV["AWS_KEY"], secret_access_key: ENV["AWS_SECRET"]},
                    bucket: "bodrov_sitepoint"

  validates_attachment :image, presence: true,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
                       size: { in: 0..500.kilobytes }
end
