#Generated at 2013-02-07 13:35:33 +0530

require 'rubygems'
require 'bundler/setup'
require 'taza/tasks'

Taza::Rake::Tasks.new do |t|
  file_hole = FileUtils.mkdir_p "artifacts/#{Time.now.to_i}"
  t.spec_opts = ["--require taza",
                "--format html --out #{file_hole}/index.html",
                "--format p" ,
                "--format FailingExamplesFormatter --out #{file_hole}/failing_examples.txt"]
end


begin; require 'parallel_tests/tasks'; rescue LoadError; end