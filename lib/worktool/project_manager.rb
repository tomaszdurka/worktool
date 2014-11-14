module Worktool
  class ProjectManager

    def initialize(projects_path)
      @projects_path = projects_path
    end

    def find_repo_path(params)
      return nil unless params[:repo]
      if params[:user]
        project = find_project(params[:user] + '/' + params[:repo])
      else
        project = find_project_by_repo(params[:repo])
      end
      Pathname.new(@projects_path).join(project).to_s
    end

    def find_project_by_repo(repo)
      matches = projects.select do |project|
        project.match(/\/#{repo}$/)
      end
      matches.first if matches
    end

    def find_project(user_repo)
      matches = projects.select do |project|
        project == user_repo
      end
      matches.first if matches
    end

    def projects
      %w(cargomedia/sk cargomedia/cm cargomedia/bipbip tomaszdurka/worktool tomaszdurka/dotfiles codespot/software-house tomaszdurka/sk)
    end
  end
end
