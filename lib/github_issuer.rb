require "github_api"
require "github_issuer/issue"

class GithubIssuer
  def initialize(config)
    @token    = config[:token]
    @repo     = config[:repo]
    @user     = config[:user]
    @client   = Github::Issues.new(
      :oauth_token => @token,
      :site        => config[:site],
      :endpoint    => config[:endpoint],
    )
  end

  def all
    @client.all(user: @user, repo: @repo).map do |res|
      Issue.new(res)
    end
  end

  def create(title, assignee = nil)
    res = @client.create(user: @user, repo: @repo, title: title, assignee: assignee)
    Issue.new(res)
  end

  def edit(number, title, assignee = nil)
    res = @client.edit(user: @user, repo: @repo, number: number, title: title, assignee: assignee)
    Issue.new(res)
  end

  def get(number)
    res = @client.get(user: @user, repo: @repo, number: number)
    Issue.new(res)
  end

  def close(number)
    res = @client.edit(user: @user, repo: @repo, number: number, :state => "closed")
    Issue.new(res)
  end

  def open(number)
    res = @client.edit(user: @user, repo: @repo, number: number, :state => "open")
    Issue.new(res)
  end
end
