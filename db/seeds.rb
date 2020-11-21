users = User.create!([
                         { name: Faker::Name.name, password: '123456' },
                         { name: Faker::Name.name, password: '123456' }
                     ])

categories = Category.create!([
                                  { title: 'Ruby on Rails' },
                                  { title: 'HTML' },
                                  { title: 'CSS' }
                              ])

tests = Test.create!([
                         { title: "Ruby start", level: 1, category_id: categories[0].id,author: users[0]},
                         { title: "RoR start", level: 2, category_id: categories[0].id,author: users[0] },
                         { title: "HTML base", level: 1, category_id: categories[1].id,author: users[0] },
                         { title: "CSS base", level: 1, category_id: categories[2].id,author: users[0] }
                     ])

questions = Question.create!([
                                 { body: 'Which typization does Ruby have?', test_id: tests[0].id },
                                 { body: 'Which class helped us to create models?', test_id: tests[1].id },
                                 { body: 'Which hyperlink form is correct?', test_id: tests[2].id },
                                 { body: 'Wherewith content can be programmed in a markup language?', test_id: tests[3].id }
                             ])

answers = Answer.create!([
                             { body: 'Dynamic', correct: true, question_id: questions[0].id },
                             { body: 'Strict', correct: false, question_id: questions[0].id },
                             { body: 'ActiveRecord', correct: true, question_id: questions[1].id },
                             { body: 'CommandRecorder', correct: false, question_id: questions[1].id },
                             { body: "<a href='some_link'...", correct: true, question_id: questions[2].id },
                             { body: "<a http='some_link'...", correct: false, question_id: questions[2].id },
                             { body: 'Tags', correct: true, question_id: questions[3].id },
                             { body: 'Functions', correct: false, question_id: questions[3].id }
                         ])
