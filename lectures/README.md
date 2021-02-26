# Lecture code for batch #543

## Deploy demo applications to Heroku

To deploy any of the demo apps to Heroku:
- clone this repository
- make sure you create or connect a `heroku` remote (`heroku create <app-name>` or `git remote add heroku <heroku-git-url>`)
- make sure you are at to the root of the repository and push the folder of the desired demo app to Heroku with
```
git subtree push --prefix lectures/<app-folder> heroku main
# for example: git subtree push --prefix lectures/restaurants_ajaxified heroku main
```
- migrate and seed `heroku run rails db:migrate db:seed`
- set the environment variables and/or add-ons required for the app `heroku config:set MAPBOX_API_KEY=...`, *etc.*