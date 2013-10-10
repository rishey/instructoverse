class Course < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :enrollments

  has_many :attendees, through: :enrollments, source: :user

  validates :title, :url, :description, presence: true
  validates :url, :format => { :with => /(http(?:s)?\:\/\/[a-zA-Z0-9\-]+(?:\.[a-zA-Z0-9\-]+)*\.[a-zA-Z]{2,6}(?:\/?|(?:\/[\w\-]+)*)(?:\/?|\/\w+\.[a-zA-Z]{2,4}(?:\?[\w]+\=[\w\-]+)?)?(?:\&[\w]+\=[\w\-]+)*)/}

end
