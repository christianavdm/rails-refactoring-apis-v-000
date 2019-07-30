class GithubRepo 
    def initialize(github_hash) 
        @name = github_hash["name"]
        @url = github_hash["html_url"]
    end

    attr_accessor :name, :url

    #  def authenticate!(the_client_id, the_client_secret, the_client_code)
    #     response = Faraday.post "https://github.com/login/oauth/access_token", {client_id: the_client_id, client_secret: the_client_secret, code: the_client_code}, {'Accept' => 'application/json'}
    #     access_hash = JSON.parse(response.body)
    #     session[:token] = access_hash["access_token"]
    
    #     user_response = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    #     user_json = JSON.parse(user_response.body)
    #     user_json["login"]
    # end
end