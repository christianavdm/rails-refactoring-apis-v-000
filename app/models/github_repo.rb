class GithubRepo 
    def initialize(github_hash) 
        @name = github_hash["name"]
        @url = github_hash["html_url"]
    end

    attr_accessor :name, :url

end