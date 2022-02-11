# biggerは二つの値を比べて、大きい方の値を返すメソッド
def bigger(x,y)
  if x > y
    x
  else
    y
  end
end

# biggestは最大値を返すメソッド
def biggest(a, b, c)

  bigger_one = bigger(a, b)

  if bigger_one == a

    biggest = bigger(a, c)

  elsif bigger_one == b

    biggest = bigger(b, c)
  end

  biggest
end

def median(a, b, c)

  biggest_number = biggest(a, b, c)

  if biggest_number == a
    median_number = bigger(b, c)
  #
  elsif biggest_number == b
    median_number = bigger(a, c)

  elsif biggest_number == c
    median_number = bigger(a, b)
  end
  median_number
end

puts median(7,5,10)
