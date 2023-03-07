<div id="header" align="center">
<img src="src/assets/lunch_and_learn.png" alt="lunch and learn" width="500" height="auto" />
</div>

# :fork_and_knife:Lunch and Learn:yum:

This application exposes backend endpoints for a future frontend application to consume. Working in a service-oriented architecture the frontend will communicate with this appplication through an API in order to build an application that searches for cuisines by country, and provide the user an opportunity to favorite recipes while learning more about the country's culture.

This project follows guidelines set in place by Turing School of Software & Design. For more information on project requirements: [Lunch and Learn](https://backend.turing.edu/module3/projects/lunch_and_learn/requirements)

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com)

## :computer:Technologies
- Rails 5.2.8
- Ruby 2.7.4
- Gems:gem::
  - faraday | jsonapi-serializer | dotenv-rails | factory_bot_rails | faker | webmock | vcr | shoulda-matchers | simplecov | rspec-rails
- External APIs:
  - This application required external API keys which are stored in a <i>.env</i> file at the top level of the program directory
    - API keys can be requested but must be named as follows:
      - :herb: EDAMAM_APP_ID - [Edamam APP ID](https://developer.edamam.com/edamam-recipe-api)
      - :seedling: EDAMAM_API_KEY - [Edamam API key](https://developer.edamam.com/edamam-recipe-api)
      - :tv: YOUTUBE_API_KEY - [Youtube](https://developers.google.com/youtube/registering_an_application)
      - :camera: UNSPLASH_ACCESS_KEY - [Unsplash](https://unsplash.com/documentation)
      - :round_pushpin: GEOAPIFY_API_KEY - [Geoapify](https://apidocs.geoapify.com/docs/places/#about)
- Postman

## :heavy_check_mark:Installation

1. Fork and clone this repository
2. `cd` into the root directiory
3. `bundle install`
4. `rails db:{drop,create,migrate}`
5. Run the test suite with `bundle exec rspec`
6. Start the local server by running `rails s`
7. Visit the app on `localhost:3000` in your web browser

## :round_pushpin:Endpoints

<details close>

### Get a Country's Recipe


```http
GET /api/v1/recipes?country=<COUNTRY>
```

<details close>
<summary>  Details </summary><br>
  * This endpoint returns recipes based off a country parameter
<br><br>
    
Parameters: <br>
```
Country
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Value:

```json

{
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "A Slice of Spain: The Spanish Tortilla",
                "url": "https://recipe-link.com",
                "country": "Spain",
                "image": "https://image-link.com"
            }
        },
        {"etc"}
    ]
}

```

</details>

---


### Get a Country's Learning Resources
```http
GET /api/v1/learning_resources?country=<COUNTRY>
```


<details close>
<summary>  Details </summary><br>
  * This endpoint returns learning resources for a country
<br><br>
    
Parameters: <br>
```
Country
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Value:

```json

{
    "data": {
        "id": null,
        "type": "learning_resources",
        "attributes": {
            "country": "spain",
            "video": {
                "title": "A Super Quick History of Spain",
                "youtube_video_id": "nQh6V8adGXw"
            },
            "images": [
                {
                    "alt_tag": "people walking near church during daytime",
                    "url": "https://images1-url.com"
                },
                {
                    "alt_tag": "red petaled flower field",
                    "url": "https://images.unsplash.com/photo-1562165662-66cbc1a5bbe2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=Mnw0MTg1Njh8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NzgyMjk5MjI&ixlib=rb-4.0.3&q=80&w=1080"
                },
                {
                    "alt_tag": "red petaled flower field",
                    "url": "https://image2-url.com"
                },
                {"etc"}
           ]
        }
    }
}
```

</details>

---


### Create a User
```http
POST "/api/v1/users"
```

<details close>
<summary>  Details </summary><br>
  * This endpoint creates a user and generates an api_key for that user
<br><br>
    
Parameters: <br>
```
CONTENT_TYPE=application/json
```

| Code | Description |
| :--- | :--- |
| 201 | `CREATED` |

Example Value:

```json

{
    "data": {
        "id": "3",
        "type": "user",
        "attributes": {
            "name": "Harry Potter",
            "email": "harry.potter@hogwarts.com",
            "api_key": "50ccb3fae6a7077da81cffa7e348ca0b"
        }
    }
}
```

</details>

---


### Create a Favorite Recipe
```http
POST "/api/v1/favorites"
```

<details close>
<summary>  Details </summary><br>
  * This endpoint creates a favorite recipe
<br><br>
    
Parameters: <br>
```
CONTENT_TYPE=application/json
```

| Code | Description |
| :--- | :--- |
| 201 | `CREATED` |

Example Value:

```json

{
    "success": "Favorite added successfully"
}
```

</details>

---


### Get a User's Favorite Recipes
```http
GET "/api/v1/favorites?api_key=<USER.API_KEY>"
```

<details close>
<summary>  Details </summary><br>
  * This endpoint gets favorite recipes for a user
<br><br>
    
Parameters: <br>
```
User api_key
```

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Example Value:

```json

{
    "data": [
        {
            "id": "1",
            "type": "favorites",
            "attributes": {
                "country": "thailand",
                "recipe_link": "www.recipe-link.com",
                "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                "created_at": "2023-03-06T23:58:53.967Z"
            }
        },
        {
            "id": "2",
            "type": "favorites",
            "attributes": {
                "country": "france",
                "recipe_link": "www.recipe-link.com",
                "recipe_title": "Brie and baguette",
                "created_at": "2023-03-07T18:38:22.777Z"
            }
        },
        {"etc"}
    ]
}
```

</details>
</details>

## :twisted_rightwards_arrows:Database Schema

![Screen Shot 2023-03-07 at 14 21 45](https://user-images.githubusercontent.com/111314699/223566868-6347d55a-56ba-4d60-a334-f14476d2d784.png)


