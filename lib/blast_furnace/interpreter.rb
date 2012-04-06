module BlastFurnace
end

class BlastFurnace::Interpreter
  def interpret *expressions
    expressions.each do |expression|
      puts <<EOF
public class #{expression.last} {
}
EOF
    end
  end
end