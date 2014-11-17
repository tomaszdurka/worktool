require 'worktool'

describe Worktool::Github do

  let(:github) { Worktool::Github.new }

  it 'extract github_url' do
    github.extract('http://github.com/user/repo/issues/123').should eq({:user => 'user', :repo => 'repo', :issue => 123})
    github.extract('http://github.com/user/repo/pull/123').should eq({:user => 'user', :repo => 'repo', :issue => 123})
    github.extract('http://github.com/user/repo/invalid/123').should eq({:user => 'user', :repo => 'repo'})
    github.extract('http://github.com/user/repo/issues').should eq({:user => 'user', :repo => 'repo'})
    github.extract('http://www.github.com/user/repo/issues').should eq({:user => 'user', :repo => 'repo'})
    github.extract('http://github.com/user/repo/something/else/which/doesnt/matter').should eq({:user => 'user', :repo => 'repo'})
    github.extract('http://hubgit.com/user/repo/issues/123').should eq(nil)
  end

  it 'extract github_hash' do
    github.extract('user/repo#123').should eq({:user => 'user', :repo => 'repo', :issue => 123})
    github.extract('user/repo').should eq({:user => 'user', :repo => 'repo'})
    github.extract('user/repo/asdas').should eq(nil)
  end

  it 'extract github_hash short' do
    github.extract('repo#123').should eq({:repo => 'repo', :issue => 123})
    github.extract('repo').should eq({:repo => 'repo'})
  end
end
