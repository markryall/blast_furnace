module BlastFurnace
end

class BlastFurnace::ClassNode < Struct.new :name
  def eval context
    self.name = context.namespace ? "#{context.namespace}/#{name}" : name
    namespaces, class_name = namespace_class name
    path = "#{context.destination}/#{name}.java"
    FileUtils.mkdir_p File.dirname path
    File.open(path, 'w') do |io|
    io.puts <<EOF
#{package_declaration(namespaces)}public class #{class_name} {
}
EOF
    end
  end

  def package_declaration namespaces
    namespaces.empty? ? '' : <<EOF
package #{namespaces.join '.'};

EOF
  end

  def namespace_class name
    parts = name.split '/'
    [parts[0..-2], parts[-1]]
  end
end