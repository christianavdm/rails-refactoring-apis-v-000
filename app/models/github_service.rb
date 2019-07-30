class GithubService
    def initialize(access_hash = {"access_token": nil}) 
        @access_token = access_hash["access_token"]
    end

    attr_accessor :access_token

    def authenticate!(the_client_id, the_client_secret, the_client_code)
        response = Faraday.post "https://github.com/login/oauth/access_token", {client_id: the_client_id, client_secret: the_client_secret, code: the_client_code}, {'Accept' => 'application/json'}
        access_hash = JSON.parse(response.body)
        self.access_token = access_hash["access_token"]
    end 

    def get_username
        user_response = Faraday.get "https://api.github.com/user", {}, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
        user_json = JSON.parse(user_response.body)
        user_json["login"]
    end

    def get_repos 
        response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
        repos_resp = JSON.parse(response.body)
        new_repos = []
        repos_resp.each do |repo|
            repository = GithubRepo.new(repo)
            new_repos << repository
        end

        new_repos
    end

    def create_repo(repo_name)
        response = Faraday.post "https://api.github.com/user/repos", {name: repo_name}.to_json, {'Authorization' => "token #{self.access_token}", 'Accept' => 'application/json'}
    end
end