user = User.create!([
                        {  password: '123456', email: 'test@test.ru', confirmed_at: Date.today }
                    ])


admin = Admin.create!([
                         { first_name: 'admin', last_name: 'admin' , password: '123456', email: 'admin@admin.ru', confirmed_at: Date.today }
                     ])

categories = Category.create!([
                                  { title: 'Ruby on Rails' },
                                  { title: 'HTML' },
                                  { title: 'CSS' }
                              ])

tests = Test.create!([
                         { title: "Ruby start", level: 1, category_id: categories[0].id,author: admin[0]},
                         { title: "RoR start", level: 2, category_id: categories[0].id,author: admin[0] },
                         { title: "HTML base", level: 1, category_id: categories[1].id,author: admin[0] },
                         { title: "CSS base", level: 1, category_id: categories[2].id,author: admin[0] }
                     ])

questions = Question.create!([
                                 { body: 'Which typization does Ruby have?', test_id: tests[0].id },
                                 { body: 'Which class helped us to create models?', test_id: tests[0].id },
                                 { body: 'Which hyperlink form is correct?', test_id: tests[0].id },
                                 { body: 'Wherewith content can be programmed in a markup language?', test_id: tests[0].id },
                                 { body: 'Which typization does Ruby have?', test_id: tests[1].id },
                                 { body: 'Which class helped us to create models?', test_id: tests[1].id },
                                 { body: 'Which hyperlink form is correct?', test_id: tests[2].id },
                                 { body: 'Wherewith content can be programmed in a markup language?', test_id: tests[3].id }
                             ])

answers = Answer.create!([
                             { body: 'Dynamic', correct: true, question_id: questions[0].id },
                             { body: 'Strict', correct: false, question_id: questions[0].id },
                             { body: 'ActiveRecord', correct: false, question_id: questions[0].id },
                             { body: 'CommandRecorder', correct: false, question_id: questions[0].id },

                             { body: 'Dynamic', correct: true, question_id: questions[1].id },
                             { body: 'Strict', correct: false, question_id: questions[1].id },
                             { body: 'ActiveRecord', correct: false, question_id: questions[1].id },
                             { body: 'CommandRecorder', correct: false, question_id: questions[1].id },

                             { body: 'Dynamic', correct: true, question_id: questions[2].id },
                             { body: 'Strict', correct: false, question_id: questions[2].id },
                             { body: 'ActiveRecord', correct: false, question_id: questions[2].id },
                             { body: 'CommandRecorder', correct: false, question_id: questions[2].id },

                             { body: 'Dynamic', correct: true, question_id: questions[3].id },
                             { body: 'Strict', correct: false, question_id: questions[3].id },
                             { body: 'ActiveRecord', correct: false, question_id: questions[3].id },
                             { body: 'CommandRecorder', correct: false, question_id: questions[3].id },

                             { body: "<a href='some_link'...", correct: true, question_id: questions[4].id },
                             { body: "<a http='some_link'...", correct: false, question_id: questions[4].id },
                             { body: 'Tags', correct: true, question_id: questions[4].id },
                             { body: 'Functions', correct: 0, question_id: questions[4].id }
                         ])
