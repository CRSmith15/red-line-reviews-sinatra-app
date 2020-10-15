chance = User.create(email:"chance@chance.com", name:"Chance", bio:"I love playing games and sharing what I thought about them!", password:"password")

joe = User.create(email:"joe@joe.com", name:"Joe", bio:"I love playing games and sharing what I thought about them!", password:"password")

Review.create(game_title:"The Witcher 3: The Wild Hunt", score: 100, description:"Amazing open world rpg where you fight all sorts of magical monsters. Every choice matters.", user_id: chance.id)

Review.create(game_title:"Madden 21", score: 20, description:"Another year of the same game with a roster update from the money hungry EA. DO NOT BUY IT!!!", user_id: joe.id)