# UFPI Eventos

This is a project that aims to manage upgoing events at Universidade Federal do Píaui.

## How To Setup

* Install Ruby
* Install Rails
* Run on Terminal
> Bundle Install
* Run the Server
> Rails s
* To run the tests
> Rails -s

## Dependencies
* Shrine
* Autonumeric-rails
* Devise
* Omniauth-Facebook

## Endpoints Usage
| Path | Method | Purpose |
|:------------------------:|:----------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| /event | GET / POST | It returns all events that are register in database. It can pass some ordering params, right now you can order by 'Date' and 'Value'. You can pass this values in the url, or the body of request. For a decrescent ordering, you must pass the attribute name followed by 'desc' like "?date=desc". The otherway you can do by "?date=asc". In this endpoint it will only return events that are published, and will happen in a future date. |
| /event/id | GET | It return the event specified by the id in url parameter |
| /event/add | POST | In this endpoint you can add new events to your database. For default the event will get status "Pendent". An example of the json that you need to pass to server is provide below. |
| /event/:event_id/publish | GET | In this endpoint you set the published flag of the event to true, and update his status to "Approved" |
| /event/:event_id/reject | GET | In this endpoint you set the published flag of the event to false, and update his status to "Reject" |
| /event/search | GET | In this endpoint you can pass specific parameters that will act as filters. Right now you can pass "name", and "user_id", "date" and "published". |
| /users/id | GET | It return the information about a specific user by its id |
| /academic | GET | It return all the academic events registered in database |
| /Cultural | GET | It return all the cultural events registered in database, that will happen in a future date. Right now it will return also the Unpublished ones. |
| /users/:id | GET | It will return the information about a specific user by its ID. |
| /event | POST | Event registration. you need to sendo to server, date, name, description, image_url, value, address, contact, type in  the message body |
| /auth | POST | Email registration. Requires email, password, and password_confirmation params.  |
| auth/sign_in | POST | Email authentication. Requires email and password as params. This route will return a JSON representation of the User model on successful login along with the access-token and client in the header of the response. |

### Examples Of Returned Data

* /event
```javascript
[
    {
        "event_id": 30,
        "name": "Makenna Reilly",
        "description": "Amet porro esse quaerat aliquid.",
        "value": "56.54",
        "address": "Roberts Centers",
        "contact": "owen@rippin.name",
        "type": "Academic",
        "date": "2017-10-02T00:00:00.000Z",
        "images": [
            "http://lorempixel.com/300/300"
        ],
        "status": "pending",
        "user": 20,
        "published": true,
        "lat": "40.561791064605785",
        "long": "14.530943974654548"
    },
    {
        "event_id": 31,
        "name": "Henry Collier",
        "description": "Et cupiditate dolor vel.",
        "value": "63.81",
        "address": "Edythe Flat",
        "contact": "jennie@ryan.info",
        "type": "Academic",
        "date": "2017-10-06T00:00:00.000Z",
        "images": [
            "http://lorempixel.com/300/300"
        ],
        "status": "pending",
        "user": 21,
        "published": true,
        "lat": "13.390221663010323",
        "long": "143.354924744708"
    },
  ]
```

* /users/:id
```javascript
{
    "id": 20,
    "provider": "email",
    "uid": "randi@murphy.co",
    "name": "Mathew Wyman",
    "nickname": null,
    "image": null,
    "email": "randi@murphy.co",
    "events": [
        30
    ]
}
```

### Examples Of Sending Data

* /event/add

```javascript
{
 "event":{
  "description": "DFASF",
  "value": "12.3",
  "name": "Event",
  "address": "Rua 100",
  "type": "Academic",
  "contact": "Assf",
  "user_id": "1",
  "lat": "904.34",
  "long": "459.6",
  "date": "2017-08-30T19:47:12.403Z",
  "images_attributes": [
   {"image_url":"Lorem.com.br"}
  ]
 }
}
```

### Token Header Format

The authentication information should be included by the client in the headers of each request. The headers follow the [RFC 6750 Bearer Token](http://tools.ietf.org/html/rfc6750) format:

### Authentication headers example:
~~~
"access-token": "wwwww",
"token-type":   "Bearer",
"client":       "xxxxx",
"expiry":       "yyyyy",
"uid":          "zzzzz"
~~~

The authentication headers consists of the following params:

| param | description |
|---|---|
| **`access-token`** | This serves as the user's password for each request. A hashed version of this value is stored in the database for later comparison. This value should be changed on each request. |
| **`client`** | This enables the use of multiple simultaneous sessions on different clients. (For example, a user may want to be authenticated on both their phone and their laptop at the same time.) |
| **`expiry`** | The date at which the current session will expire. This can be used by clients to invalidate expired tokens without the need for an API request. |
| **`uid`** | A unique value that is used to identify the user. This is necessary because searching the DB for users by their access token will make the API susceptible to [timing attacks](http://codahale.com/a-lesson-in-timing-attacks/). |

The authentication headers required for each request will be available in the response from the previous request. If you are using the [ng-token-auth](https://github.com/lynndylanhurley/ng-token-auth) AngularJS module or the [jToker](https://github.com/lynndylanhurley/j-toker) jQuery plugin, this functionality is already provided.
