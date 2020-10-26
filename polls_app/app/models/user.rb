# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many :authored_polls,
        foreign_key: :author_id,
        class_name: :Poll

    has_many :responses,
        foreign_key: :user_id,
        class_name: :Response

    def completed_polls
        Poll.find_by_sql(<<-SQL)
            SELECT
                polls.*
            FROM
                polls
            JOIN
                questions ON polls.id = questions.poll_id
            LEFT OUTER JOIN (
                    SELECT
                        *
                    FROM
                        responses
                    WHERE
                        user_id = #{self.id}
                ) AS responses ON answer_choices.id = responses.answer_id
            GROUP BY
                polls.id
            HAVING
                COUNT(DISTINCT questions.id) = COUNT(responses.*)
        SQL
    end

    def completed_polls_record
        join_left = <<-SQL
        LEFT OUTER JOIN (
            SELECT
                *
            FROM
                responses
            WHERE
                user_id = #{self.id}
        ) AS responses ON answer_choices.id = responses.answer_id
        SQL

        Poll.joins(questions: :answer_choices)
            .joins(join_left)
            .group('polls.id')
            .having('COUNT(DISTINCT questions.id) = COUNT(responses.id)')
    end

    def not_completed_polls_record
        join_left = <<-SQL
        LEFT OUTER JOIN (
            SELECT
                *
            FROM
                responses
            WHERE
                user_id = #{self.id}
        ) AS responses ON answer_choices.id = responses.answer_id
        SQL

        Poll.joins(questions: :answer_choices)
            .joins(join_left)
            .group('polls.id')
            .having('COUNT(DISTINCT questions.id) > COUNT(responses.id)')
            .having('COUNT(responses.id) > 0')
    end
end
