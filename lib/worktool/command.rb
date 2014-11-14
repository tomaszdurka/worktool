module Worktool
  class Command < Clamp::Command

    parameter 'query', 'query - simple issue, repo, url', :attribute_name => :query

    def execute
      commands = []
      params = Worktool::Github.new.extract(query)
      manager = Worktool::ProjectManager.new('/Users/tomasz/projects');
      commands << 'cd ' + manager.find_repo_path(params)
      commands << 'gi checkout ' + params[:issue] if params[:issue]
      puts commands
    end
  end
end
