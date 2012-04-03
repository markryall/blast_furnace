Gem::Specification.new do |spec|
  spec.name = 'blast_furnace'
  spec.version = '0.0.3'
  spec.summary = "an intense gem that children snould probably be warned off"
  spec.description = <<-EOF
A BLAST FURNACE!

What more do you want to know?
EOF

  spec.authors << 'Mark Ryall'
  spec.email = 'mark@ryall.name'
  spec.homepage = 'http://github.com/markryall/blast_furnace'

  spec.files = Dir['lib/**/*'] + Dir['bin/*'] + ['README.rdoc', 'MIT-LICENSE']
  spec.executables << 'blast'

  spec.add_development_dependency 'rake', '~>0'
  spec.add_development_dependency 'rspec', '~>2'
end