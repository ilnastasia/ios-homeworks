
import Foundation

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

let postInfo = [
    Post(author: "moscow.news", description: "Заболеваемость ковидом в Москве за сутки достигла 10000 человек.", image: "corona", likes: 281, views: 576),
    Post(author: "just_dog", description: "Гуляю", image: "dog", likes: 1437, views: 1945),
    Post(author: "restaurant.shabolovskaya", description: "Сегодня у нас в меню потрясающие королевские крабы со скидкой 20% при бронировании столика через наш аккаунт. Ждем вас!", image: "crab", likes: 540, views: 784),
    Post(author: "oleg_worldtraveller", description: "Сегодня встретил редкое животное: это манул!", image: "manul", likes: 754, views: 1094)]

let photosArray = ["sverhi1", "dog1", "swiss1", "mandalorian1", "sverhi2", "dog2", "swiss2", "mandalorian2", "sverhi3", "dog3", "swiss3", "mandalorian3", "sverhi4", "dog4", "swiss4", "mandalorian4", "sverhi5", "dog5", "swiss5", "mandalorian5"]
