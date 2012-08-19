
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

task :fixture do
  sh "ruby kimchi.rb"
end