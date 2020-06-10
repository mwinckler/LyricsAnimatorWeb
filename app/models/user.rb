class User < ApplicationRecord
  has_secure_password
  has_secure_password :recovery_password, validations: false

  has_many :audio_files, dependent: :destroy
end
