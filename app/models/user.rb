class User < ActiveRecord::Base
	has_many :created_courses, class_name: "Course", foreign_key: :creator_id
	has_many :enrollments
	has_many :attended_courses, through: :enrollments, source: :course
  # has_secure_password
  # validates_presence_of :username, :email
  # validates_uniqueness_of :username, :email

   def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      # user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
end
