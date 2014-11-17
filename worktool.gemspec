Gem::Specification.new do |s|

  s.name = 'worktool'
  s.authors = ['Tomasz Durka']
  s.date = Date.today.to_s
  s.email = 'tomasz@durka.pl'
  s.homepage = 'https://github.com/tomaszdurka/worktool.git'
  s.license = 'MIT'

  s.summary = 'Tool for navigating beetwen github based projects and their issues'
  s.version = '0.1.0'

  s.add_runtime_dependency 'clamp', '~> 0.6.0'
  s.add_runtime_dependency 'git', '~> 1.2.0'
  s.add_runtime_dependency 'github_api', '~> 0.10.0'
  s.add_runtime_dependency 'term-ansicolor', '~> 1.2.0'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.0'

  s.files = Dir.glob 'lib/**/*'
  s.executables = ['worktool']
end
