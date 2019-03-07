# ThankYou

A recommendations database.

## Achievements

[![Build Status](https://travis-ci.org/nixsolutions/thank-you.svg?branch=master)](https://travis-ci.org/nixsolutions/thank-you)

## Getting started

## Developing

Install ruby dependencies:

```shell
bundle install
```

Copy database.yml.example into database.yml:

```shell
cp database.yml.example database.yml
```

Make your db configurations and install yarn dependencies:

```shell
yarn install
```

Create and migrate database:

```shell
rake db:create && rake db:migrate
```

Go to rails console and create an Invitation:

```shell
Invitation.create
```

Copy token and go to "localhost:3000/users/sign_up/your_invitation_token"

Register a user.

You can sign in if you go to "localhost:3000/users/sign_in"

## Demo

## License
The project is developed by [NIX Solutions](http://nixsolutions.com) Ruby team and distributed under [MIT LICENSE](https://raw.github.com/nixsolutions/thank-you/master/LICENSE)

