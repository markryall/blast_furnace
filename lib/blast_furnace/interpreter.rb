module BlastFurnace
end

class BlastFurnace::Interpreter
  def interpret *expressions
    expressions.each do |clazz|
      File.open("src/#{clazz.name}.java", "w") do |io|
      io.puts <<EOF
public class #{clazz.name} {
}
EOF
      end
    end
  end
end