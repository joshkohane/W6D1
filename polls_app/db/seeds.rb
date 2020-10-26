# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Users

User.destroy_all

josh = User.create!(username: 'justjoshin')
nate = User.create!(username: 'nateyboy')
wendy = User.create!(username: 'wkdk')
david = User.create!(username: 'daddy')
adam = User.create!(username: 'speedball')
daniel = User.create!(username: 'daniel')

# Polls

Poll.destroy_all

birthday = Poll.create!(author_id: josh.id, title: 'Birthday?')
month = Poll.create!(author_id: nate.id, title: 'Month?')
vote = Poll.create!(author_id: josh.id, title: 'Vote?')
dinner = Poll.create!(author_id: david.id, title: 'Dinner?')

# Question

Question.destroy_all

august = Question.create!(body: 'What month is my birthday?', poll_id: birthday.id)
gifts = Question.create!(body: 'What are you getting me for my birthday?', poll_id: birthday.id)
party = Question.create!(body: 'Are you throwing me a party for my birthday?', poll_id: birthday.id)
now = Question.create!(body: 'What month is it right now?', poll_id: month.id)
next_month = Question.create!(body: 'What month comes next?', poll_id: month.id)
weather = Question.create!(body: 'What is the weather this month?', poll_id: month.id)
have_you = Question.create!(body: 'Have you voted yet?', poll_id: vote.id)
who = Question.create!(body: 'Who are you voting for', poll_id: vote.id)
how = Question.create!(body: 'Do you have a voting plan?', poll_id: vote.id)
yummy = Question.create!(body: 'What is for dinner tonight?', poll_id: dinner.id)
cooking = Question.create!(body: 'Who is cooking tonight?', poll_id: dinner.id)

# Answer Choices

AnswerChoice.destroy_all

august1 = AnswerChoice.create!(question_id: august.id, body: 'August')
august2 = AnswerChoice.create!(question_id: august.id, body: 'September')
august3 = AnswerChoice.create!(question_id: august.id, body: 'October')

gifts1 = AnswerChoice.create!(question_id: gifts.id, body: 'Beyonce')
gifts2 = AnswerChoice.create!(question_id: gifts.id, body: 'Puppy')
gifts3 = AnswerChoice.create!(question_id: gifts.id, body: 'Sleep')

party1 = AnswerChoice.create!(question_id: party.id, body: 'No')
party2 = AnswerChoice.create!(question_id: party.id, body: 'Yes')
party3 = AnswerChoice.create!(question_id: party.id, body: 'Surprise')

now1 = AnswerChoice.create!(question_id: now.id, body: 'August')
now2 = AnswerChoice.create!(question_id: now.id, body: 'September')
now3 = AnswerChoice.create!(question_id: now.id, body: 'October')

next_month1 = AnswerChoice.create!(question_id: next_month.id, body: 'September')
next_month2 = AnswerChoice.create!(question_id: next_month.id, body: 'October')
next_month3 = AnswerChoice.create!(question_id: next_month.id, body: 'November')

weather1 = AnswerChoice.create!(question_id: weather.id, body: 'Cold')
weather2 = AnswerChoice.create!(question_id: weather.id, body: 'Beautiful')
weather3 = AnswerChoice.create!(question_id: weather.id, body: 'Icky')

have_you1 = AnswerChoice.create!(question_id: have_you.id, body: 'Yes')
have_you2 = AnswerChoice.create!(question_id: have_you.id, body: 'Not yet')
have_you3 = AnswerChoice.create!(question_id: have_you.id, body: 'No')

who1 = AnswerChoice.create!(question_id: who.id, body: 'The good guy')
who2 = AnswerChoice.create!(question_id: who.id, body: 'The bad guy')
who3 = AnswerChoice.create!(question_id: who.id, body: 'No one')

how1 = AnswerChoice.create!(question_id: how.id, body: 'In person')
how2 = AnswerChoice.create!(question_id: how.id, body: 'Early')
how3 = AnswerChoice.create!(question_id: how.id, body: 'By mail')

yummy1 = AnswerChoice.create!(question_id: yummy.id, body: 'Lasagna')
yummy2 = AnswerChoice.create!(question_id: yummy.id, body: 'Turkey')
yummy3 = AnswerChoice.create!(question_id: yummy.id, body: 'Meatballs')

cooking1 = AnswerChoice.create!(question_id: cooking.id, body: 'Josh')
cooking2 = AnswerChoice.create!(question_id: cooking.id, body: 'Nate')
cooking3 = AnswerChoice.create!(question_id: cooking.id, body: 'David')

# # Responses

Response.destroy_all

Response.create!(user_id: david.id, answer_id: august1.id)
Response.create!(user_id: nate.id, answer_id: august1.id)
Response.create!(user_id: wendy.id, answer_id: august3.id)

Response.create!(user_id: nate.id, answer_id: gifts1.id)
Response.create!(user_id: adam.id, answer_id: gifts3.id)
Response.create!(user_id: daniel.id, answer_id: gifts3.id)

Response.create!(user_id: wendy.id, answer_id: party1.id)
Response.create!(user_id: david.id, answer_id: party2.id)
Response.create!(user_id: nate.id, answer_id: party3.id)

Response.create!(user_id: josh.id, answer_id: now1.id)
Response.create!(user_id: adam.id, answer_id: now1.id)
Response.create!(user_id: daniel.id, answer_id: now1.id)

Response.create!(user_id: josh.id, answer_id: next_month2.id)
Response.create!(user_id: wendy.id, answer_id: next_month2.id)
Response.create!(user_id: david.id, answer_id: next_month3.id)

Response.create!(user_id: adam.id, answer_id: weather1.id)
Response.create!(user_id: daniel.id, answer_id: weather2.id)
Response.create!(user_id: david.id, answer_id: weather3.id)

Response.create!(user_id: nate.id, answer_id: have_you1.id)
Response.create!(user_id: david.id, answer_id: have_you2.id)
Response.create!(user_id: daniel.id, answer_id: have_you2.id)

Response.create!(user_id: wendy.id, answer_id: who1.id)
Response.create!(user_id: adam.id, answer_id: who1.id)
Response.create!(user_id: daniel.id, answer_id: who1.id)

Response.create!(user_id: nate.id, answer_id: how1.id)
Response.create!(user_id: wendy.id, answer_id: how2.id)
Response.create!(user_id: david.id, answer_id: how3.id)

Response.create!(user_id: josh.id, answer_id: yummy1.id)
Response.create!(user_id: nate.id, answer_id: yummy1.id)
Response.create!(user_id: wendy.id, answer_id: yummy1.id)

Response.create!(user_id: josh.id, answer_id: cooking1.id)
Response.create!(user_id: nate.id, answer_id: cooking1.id)
Response.create!(user_id: wendy.id, answer_id: cooking1.id)