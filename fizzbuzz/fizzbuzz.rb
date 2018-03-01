class FizzBuzz
  
  def convert(num)
    if (num % 3 == 0) and (num % 5 == 0) then
      return "FizzBuzz"
    elsif num % 3 == 0 then
      return "Fizz"
    elsif num % 5 == 0 then
      return "Buzz"
    else
      return num.to_s
    end
  end

end
