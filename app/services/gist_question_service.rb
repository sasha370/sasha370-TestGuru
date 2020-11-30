class GistQuestionService

  def initialize(question, client: nil )
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: '87f5c887235e34dd68556a70af991d4139b3a92a')

  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201 || 200
  end

  private

  def gist_params
    {
        description: I18n.t('.header', title: @test.title),
        files: {
            'test-guru-question.txt' => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end
