require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format json --out #{ENV['CIRCLE_TEST_REPORTS']}/cucumber/tests.cucumber"
end

task :build do
  sh "docker build -t shift/letsencrypt ."
end

task :audit do
  sh "docker run -it shift/letsencrypt apk audit"
  sh "docker run -it shift/letsencrypt apk stats"
end

task :test do
  sh "docker run -d -it --rm shift/letsencrypt letsencrypt -c /etc/letsencrypt/letsencrypt.test.conf"
  sh ""
end

task :default => [:build, :audit]
