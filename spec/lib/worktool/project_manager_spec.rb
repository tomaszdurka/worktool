require 'worktool'
require 'tmpdir'
require 'fileutils'

describe Worktool::ProjectManager do

  let(:manager) {
    manager = Worktool::ProjectManager.new('/projects_path')
    manager.stub(:projects) { %w(cargomedia/sk cargomedia/CM cargomedia/bipbip tomaszdurka/worktool tomaszdurka/dotfiles codespot/software-house tomaszdurka/sk) }
    manager
  }

  it 'find_user_by_repo' do
    manager.find_project_by_repo('sk').should eq('cargomedia/sk')
    manager.find_project_by_repo('foo').should eq(nil)
  end

  it 'find_repo_path' do
    manager.find_repo_path({:repo => 'sk'}).should eq('/projects_path/cargomedia/sk')
    manager.find_repo_path({:repo => 'software-house'}).should eq('/projects_path/codespot/software-house')
    manager.find_repo_path({:user => 'tomaszdurka', :repo => 'sk'}).should eq('/projects_path/tomaszdurka/sk')
  end

  it 'projects' do
    path = Pathname.new(Dir.mktmpdir)
    projects = %w(tomaszdurka/worktool tomaszdurka/dotfiles codespot/software-house)
    projects.each do |project|
      FileUtils.mkdir_p(path.join(project))
    end
    File.write(path.join('tomaszdurka/file').to_s, 'content')
    manager = Worktool::ProjectManager.new(path.to_s)
    manager.projects.should =~ projects
  end
end
