module ApplicationHelper

  def current_year
    Time.now.year
  end

  def create_github_link(author_name, repo)
    link_to "#{t('activerecord.attributes.test.user_id')}: #{author_name}", "http://github.com/#{author_name}/#{repo}", target: '_blank'
  end

  def gist_hash(url)
    url.split('/').last
  end

end
