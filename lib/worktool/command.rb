module Worktool
  class Command < Clamp::Command

    parameter 'query', 'query - simple issue, repo, url', :attribute_name => :query

    def execute
      commands = []
      params = Worktool::Github.new.extract(query)
      manager = Worktool::ProjectManager.new(ENV['PROJECTS_PATH'])
      repo = manager.find_repo_path(params)
      if repo
        commands << 'cd ' + repo.to_s
        if params[:issue]
          commands << 'gi checkout ' + params[:issue].to_s
        end
      end
      puts commands.join(' && ')
    end
  end
end
