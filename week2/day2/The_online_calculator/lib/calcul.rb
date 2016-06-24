class Calculator
  def initialize(n1,n2,oper)
    @n1 = n1
    @n2 = n2
    @oper = oper
  end

  def do_operation
    case @oper
    when "+"
      @n1 + @n2
    when "*"
      @n1 * @n2
    when "-"
      @n1 - @n2
    when "/"
      @n1 / @n2
    end
  end
end
