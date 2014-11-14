module Worktool
  class Command < Clamp::Command

    parameter 'query', 'query - simple issue, repo, url', :attribute_name => :query

    def execute
      puts Worktool::Github.new.extract(query)
    end
  end
end
