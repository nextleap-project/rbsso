require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "test/**/*_test.rb"
  t.libs << 'test'
end

task :rcov do |t|
  ENV['RCOV'] = 'YES'
  Rake::Task['test'].invoke
end
