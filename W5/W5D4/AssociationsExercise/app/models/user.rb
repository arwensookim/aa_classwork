# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

  has_many :enrollments,
  primary_key: :id,
  foreign_key: :student_id,
  class_name: :Enrollment

  has_many :enrolled_courses,   # to get all the courses a strudent is enrolled in
    through: :enrollments,
    source: :course

  has_many :taught_courses,
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :Course     # the class that we are connecting to

end
