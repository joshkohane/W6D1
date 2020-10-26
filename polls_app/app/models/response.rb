# == Schema Information
#
# Table name: responses
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Response < ApplicationRecord
    validate :not_dulicate_response
    validate :own_author?

    belongs_to :respondent,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :answer_choice,
        foreign_key: :answer_id,
        class_name: :AnswerChoice

    has_one :question,
        through: :answer_choice,
        source: :question

    def sibling_responses
        self.question.responses
            .where.not(id: self.id)
    end

    def respondent_already_answered?
        sibling_responses.exists?(user_id: self.user_id)
    end

    def not_dulicate_response
        if respondent_already_answered?
            errors[:user_id] << 'Cannot answer same question twice'
        end
    end

    def own_author?
        if self.answer_choice.question.poll.author_id == self.user_id
            errors[:user_id] << 'Cannot respond to your own poll'
        end
    end
end
