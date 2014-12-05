10.times do |i|
  Card.create(value: (i + 1), suit: "spades", played: false)
  Card.create(value: (i + 1), suit: "clubs", played: false)
  Card.create(value: (i + 1), suit: "hearts", played: false)
  Card.create(value: (i + 1), suit: "diamonds", played: false)
end

array = ["J", "Q", "K", "A"]

array.each do |value|
  Card.create(value: value, suit: "spades", played: false)
  Card.create(value: value, suit: "clubs", played: false)
  Card.create(value: value, suit: "hearts", played: false)
  Card.create(value: value, suit: "diamonds", played: false)
end

