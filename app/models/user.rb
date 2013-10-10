class User < ActiveRecord::Base
	has_many :created_courses, class_name: "Course", foreign_key: :creator_id
	has_many :enrollments
	has_many :attended_courses, through: :enrollments, source: :course
  has_secure_password
  validates_presence_of :username, :email
  validates_uniqueness_of :username, :email
end
