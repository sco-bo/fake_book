#Fake Book
[View this app in action!](https://hidden-chamber-98363.herokuapp.com/) This is essentially a Facebook clone with (in my humble opinion) an even better interface than Facebook. :)

###Basic Account Creation and Login
Sign up and Login are simple and use the [devise](https://github.com/plataformatec/devise) gem.
![Alt text](https://github.com/sco-bo/fake_book/tree/master/public/screenshots/Login.png?raw=true) 

###Login with Facebook
The app communicates with the Facebook API, allowing users to sign in using their Facebook account. This uses devise and the [omniauth](https://github.com/intridea/omniauth) gem to ensure easy and secure authentication. 

###Friends and Soon-to-be-friends
The friending model is the same as Facebook, in that a user must confirm that you are both friends before you become friends. Users can accept or decline friend requests they receive. Users can also retract a friend request they've sent and un-friend a current friend (ouch!)
![Alt text](https://github.com/sco-bo/fake_book/tree/master/public/screenshots/Friend Stati.png?raw=true)

###Posts
Users can create text posts or photo posts which can then be commented on and liked. 
![Alt text](https://github.com/sco-bo/fake_book/tree/master/public/screenshots/Post1.png?raw=true)
![Alt text](https://github.com/sco-bo/fake_book/tree/master/public/screenshots/PhotoPost1.png?raw=true)

