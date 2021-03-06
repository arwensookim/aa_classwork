# == Schema Information
#
# Table name: responses
#
#  id                :bigint           not null, primary key
#  answer_choices_id :integer          not null
#  responser_id      :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Response < ApplicationRecord
    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choices_id,
        class_name: "AnswerChoice"

    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :responser_id,
        class_name: "User"
end
