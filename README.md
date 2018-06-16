##Job Listing

- Create in [facebook developers](https://developers.facebook.com/) Login via Facebook app and get ID and Secret API from here.
- Create the same in [google developers](https://console.developers.google.com/projectselector/apis/library?supportedpurview=project)
- Get the API credantials from [AWS](https://aws.amazon.com/ru/console/) S3 bucket for images upload.
- Setup .env file in root directory of the project 

##Helpful Heroku commands:

- If deploy to Heroku: setup Heroku configuration:
`heroku config:set FACEBOOK_API_KEY=xxxxxxxxxxxxxx` for all credentials from .env
`heroku pg:reset` - clear DataBase;
`heroku run rails db:migrate` - Migration files;
`heroku run rails db:seed` - To implement seeds to DataBase.