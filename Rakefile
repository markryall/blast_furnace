require 'bundler/gem_tasks'

task :default => :test

task :gen do
  sh 'racc -o lib/blast_furnace/parser.rb lib/blast_furnace/grammar.y'
end

desc 'execute specifications'
task :test do
  sh 'rspec spec'
end