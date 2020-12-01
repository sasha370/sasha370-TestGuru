class GistRestService

  def initialize(gist, client = nil)
    @gist = gist
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def check
    @client.gist(@gist.remote_id)
  rescue
    return false
  end

  def delete
    @client.delete_gist(@gist.remote_id)
  end
end
