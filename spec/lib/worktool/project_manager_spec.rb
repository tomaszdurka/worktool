require 'worktool'

describe Worktool::ProjectManager do

  let(:manager) { Worktool::ProjectManager.new('/projects_path') }

  it 'find_user_by_repo' do
    manager.find_project_by_repo('sk').should eq('cargomedia/sk')
    manager.find_project_by_repo('foo').should eq(nil)
  end

  it 'find_repo_path' do
    manager.find_repo_path({:repo => 'sk'}).should eq('/projects_path/cargomedia/sk')
    manager.find_repo_path({:repo => 'software-house'}).should eq('/projects_path/codespot/software-house')
    manager.find_repo_path({:user => 'tomaszdurka', :repo => 'sk'}).should eq('/projects_path/tomaszdurka/sk')
  end
end
