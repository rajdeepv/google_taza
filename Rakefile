#Generated at 2013-02-07 13:35:33 +0530

require 'rubygems'
require 'bundler/setup'
require 'taza/tasks'
require 'cukeforker'
require_relative 'features/support/monkey.rb'

Taza::Rake::Tasks.new do |t|
  file_hole = FileUtils.mkdir_p "artifacts/#{Time.now.to_i}"
  t.spec_opts = ["--require taza",
                "--format html --out #{file_hole}/index.html",
                "--format p" ,
                "--format FailingExamplesFormatter --out #{file_hole}/failing_examples.txt"]
end

standard_grid_options = {:max => 5,
                         :vnc => false,
                         #:format => ENV['FORMAT'],
                         :extra_args => %W[--format pretty]
}

task :grid_run_all_google do
  CukeForker::WebDriver::Runner.run(
      CukeForker::Scenarios.tagged(%W[@go] ),
      standard_grid_options)
end

task :p do
  CukeForker::Runner.run(
      CukeForker::Scenarios.tagged(%W[@go]),
      :max=>4,
      :out => "log/html",
  )
end


begin; require 'parallel_tests/tasks'; rescue LoadError; end