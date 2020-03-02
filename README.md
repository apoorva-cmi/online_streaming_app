# README

This application is provides the means to purchase an online media on demand basis. Movies and Seasons(with their episodes) can be purchased by a user, through purchase options for price and video quality.

The purchased content is available for 2 days to view.

Run the following commands to setup the application:

1. Clone the project
2. bundle install
3. rails db:setup
4. rails s

The server will start running on http://localhost:3000/

### Models and associations:

`User` model is defined to store users, for the email.

`Movie`, `Season` & `Episode` are in assocation with STI from `Content`. All the contents have title & plot. Seasons and episodes can have number as well.

Episode belongs to Season.

Movies and Season can have various `Purchase Option`, where the price and video_quality of the content can be stored.

A user can `Purchase` a content through purchase_options.

### REST APIs
1. An endpoint to return the movies, ordered by creation. (get http://localhost:3000/movies)
2. An endpoint to return the seasons ordered by creation, including the list of episodes ordered by its number. (get http://localhost:3000/seasons)
3. An endpoint to return both movies and seasons, ordered by creation. (get http://localhost:3000/contents)
4. An endpoint for a user to perform a purchase of a content.
    (post http://localhost:3000/purchases)
    input payload:
    ```
        {
            "purchase": {
                "user_email": "ab@ab.com",
                "content_id": 2,
                "content_type": "Season",
                "video_quality": "SD"
            }
        }
    ```
5. An endpoint to get the library of a user ordered by the remaining time to watch the content. (get http://localhost:3000/users/1/library)


### Testing
RSpec is used to test models and controllers. To run tests:

`rspec spec`

### System dependencies:

- Ruby version 2.3.1
- Rails version 5.1.7
- RSpec
- Postgres
- Bundler version 1.15.4
- Puma 3.12.3

### Gems used:
- gem 'active_model_serializers'
- gem 'factory_bot_rails'
- gem 'rspec-rails'
