class ClassNode < Struct.new :name
  def eval context
    path = build_path context.destination, context.namespace
    FileUtils.mkdir_p File.dirname path
    File.open(path, 'w') do |io|
    io.puts <<EOF
#{package_declaration(context.namespace)}public class #{name} {
}
EOF
    end
  end

  def build_path destination, namespace
    namespace ?
      "#{destination}/#{namespace}/#{name}.java" :
      "#{destination}/#{name}.java"
  end

  def package_declaration namespace
    namespace ? <<EOF : ''
package #{namespace.gsub('/','.')};

EOF
  end
end

class NamespaceNode < Struct.new :name
  def eval context
    context.namespace = name
  end
end