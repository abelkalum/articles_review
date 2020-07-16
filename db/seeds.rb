User.create(username: "John", password: "secret")
User.create(username: "Alex", password: "secret")
User.create(username: "William", password: "secret")

Article.create(title: "What Are Fintechs and How Can They Help Small Business?", author: "Paul Sullivan")
Article.create(title: "How to Make Your Tech Last Longer", author: "Brian Chen")
Article.create(title: "Strong cybersecurity strategy is no longer a luxury for small businesses", author: "Jim Risch")

Review.create(user_id: 1, article_id: 1, text: "A must read for anyone planning on fintech startup")
Review.create(user_id: 2, article_id: 2, text: "Article has life hacks for everyday tech tools")
Review.create(user_id: 3, article_id: 3, text: "Recommeded reading for small business owner. Well written!")
