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
                         { title: "Ruby start", level: 4, category_id: categories[0].id,author: admin[0], timer: 5},
                         { title: "RoR start", level: 3, category_id: categories[0].id,author: admin[0], timer: 1 },
                         { title: "HTML base", level: 1, category_id: categories[1].id,author: admin[0], timer: 1 },
                         { title: "CSS base", level: 1, category_id: categories[2].id,author: admin[0], timer: 1 }
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
                             { body: 'Правильный', correct: true, question_id: questions[0].id },
                             { body: 'Strict', correct: false, question_id: questions[0].id },
                             { body: 'ActiveRecord', correct: false, question_id: questions[0].id },
                             { body: 'CommandRecorder', correct: false, question_id: questions[0].id },

                             { body: 'Правильный', correct: true, question_id: questions[1].id },
                             { body: 'Strict', correct: false, question_id: questions[1].id },
                             { body: 'ActiveRecord', correct: false, question_id: questions[1].id },
                             { body: 'CommandRecorder', correct: false, question_id: questions[1].id },

                             { body: 'Правильный', correct: true, question_id: questions[2].id },
                             { body: 'Strict', correct: false, question_id: questions[2].id },
                             { body: 'Правильный', correct: true, question_id: questions[4].id },
                             { body: 'Правильный', correct: true, question_id: questions[5].id },

                             { body: 'Правильный', correct: true, question_id: questions[3].id },
                             { body: 'Strict', correct: false, question_id: questions[3].id },

                             { body: 'Правильный', correct: true, question_id: questions[7].id },
                             { body: 'CommandRecorder', correct: false, question_id: questions[7].id },

                             { body: "Правильный", correct: true, question_id: questions[4].id },
                             { body: "Неправильный", correct: false, question_id: questions[4].id },

                             { body: 'Правильный', correct: true, question_id: questions[6].id },
                             { body: 'Неправильный', correct: false, question_id: questions[6].id }
                         ])

Badge.create!(name: "За проходение всех тестов в категории HTML", image_name: "completed.jpg", rule_name: 'by_category', rule_params: categories[1].title)
Badge.create!(name: "За проходение всех тестов в категории CSS", image_name: "completed.jpg", rule_name: 'by_category', rule_params: categories[2].title)
Badge.create!(name: "За проходение любого теста с первой попытки", image_name: "first.jpg", rule_name: 'by_attempt_number', rule_params: "1")
Badge.create!(name: "За проходение всех тестов 1го уровня", image_name: "level3.png", rule_name: 'by_level', rule_params: "1")
Badge.create!(name: "За проходение всех тестов 2го уровня", image_name: "level3.png", rule_name: 'by_level', rule_params: "2")
Badge.create!(name: "За проходение всех тестов 3го уровня", image_name: "level3.png", rule_name: 'by_level', rule_params: "3")
Badge.create!(name: "За проходение трех тестов", image_name: "three.jpg", rule_name: 'by_passed_test_count', rule_params: "3")
