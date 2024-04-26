def everything_that_happens_twice_will_surely_happen_a_third_time
  num = 1
  while num <= 41
    if num.to_s.include?('3') || num % 3 == 0
      puts "#{num}っ！！！"
    elsif num == 41
      puts 'ぁおもろぉーぅ！'
    else
      puts num
    end
    num += 1
  end
end

everything_that_happens_twice_will_surely_happen_a_third_time




