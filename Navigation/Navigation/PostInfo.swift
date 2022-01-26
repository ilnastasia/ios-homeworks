
import Foundation

struct FeedPost {
    var title: String
}

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

var postInfo = [
    Post(author: "moscow.news", description: "Заболеваемость ковидом в Москве за сутки достигла 10000 человек.", image: "corona", likes: 281, views: 576),
    Post(author: "just_dog", description: "Гуляю", image: "dog", likes: 1437, views: 1945),
    Post(author: "restaurant.shabolovskaya", description: "Сегодня у нас в меню потрясающие королевские крабы со скидкой 20% при бронировании столика через наш аккаунт. Ждем вас!", image: "crab", likes: 540, views: 784),
    Post(author: "oleg_worldtraveller", description: "Сегодня встретил редкое животное: это манул!", image: "manul", likes: 754, views: 1094)]
