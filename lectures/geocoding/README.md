# Setup

- Run `bundle install` and `yarn install`
- Run `rails db:create db:migrate db:seed`
- Add your `MAPBOX_API_KEY` to the `.env` file

## Push this app to Heroku

From the root of the repository, with a `heroku` git remote:
```
git subtree push --prefix lectures/geocoding heroku main
```

## Demo app

You can [test the final app](http://geocoding-543.herokuapp.com/) in production.
