require 'bundler/gem_tasks'

task :default => :test
task(:gen) { sh 'racc -o lib/blast_furnace/parser.rb lib/blast_furnace/grammar.y' }
task(:spec => :gen) { sh 'rspec spec' }
task(:cuke => :gen) { sh 'cucumber' }
task :test => [:spec, :cuke]