# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
    belongs_to :poll,
        foreign_key: :poll_id,
        class_name: :Poll

    has_many :answer_choices,
        foreign_key: :question_id,
        class_name: :AnswerChoice

    has_many :responses,
        through: :answer_choices,
        source: :responses

    def results
        result = {}
        self.answer_choices.each do |choice|
            result[choice.body] = choice.responses.count
        end
        result
    end

    def results2
        result = {}
        self.answer_choices.includes(:responses).each do |choice|
            result[choice.body] = choice.responses.length
        end
        result
    end

    def results_by_sql
        result = AnswerChoice.find_by_sql([<<-SQL, id])
            SELECT
                answer_choices.body, COUNT(responses.id) AS num_responses
            FROM
                answer_choices
            LEFT OUTER JOIN
                responses ON answer_choices.id = responses.answer_id
            WHERE
                answer_choices.question_id = ?
            GROUP BY
                answer_choices.id

        SQL
        cur_result = {}
        result.each do |choice|
            cur_result[choice.body] = choice.num_responses
        end
        cur_result
    end

    def results_by_record
        result = self.answer_choices
            .select('answer_choices.body, count(responses.id) as num_responses')
            .left_outer_joins(:responses)
            .group('answer_choices.id')
        
        cur_result = {}
        result.each do |choice|
            cur_result[choice.body] = choice.num_responses
        end
        cur_result
    end
end
