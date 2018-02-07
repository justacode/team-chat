# TeamChat
## A simple online chat based on ActionCable with single chat room

## App functions

* User can sign in via facebook or in a standard way

* Registrated users can see the list of another registrated users

* Registrated users can send messages to each other and edit them

* Registrated users can change their personal attributes or delete account

## Dependencies

- Ruby 2.4.2
- Rails 5.1.4
- Postgrsql 9.5.1

## Bootstrap application

Clone application repository

```bash
git clone https://github.com/justacode/team-chat.git
cd team-chat
```

Configure database.yml and run command:

```bash
bin/setup
```

If you want to use omniauth facebook authentication registrate your app at https://developers.facebook.com/ and create your secrets via command:

```bash
rails secrets:setup
```

Then run edit your secrets via:


```bash
rails secrets:edit
```

And set your app_id and app_secret parameters there

