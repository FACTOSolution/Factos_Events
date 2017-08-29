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
|      Path     | Method |                                                                                                        Purpose                                                                                                        |
|:-------------:|:------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
|     /event    |   GET  |                                                                                  It returns all events that are register in database                                                                                  |
|   /event/id   |   GET  |                                                                                It return the event specified by the id in url parameter                                                                               |
| /event/search |   GET  |                                               In this endpoint you can pass specific parameters that will act as filters. Right now you can pass "name", and "user_id".                                               |
|   /users/id   |   GET  |                                                                               It return the information about a specific user by its id                                                                               |
|   /academic   |   GET  |                                                                                It return all the academic events registered in database                                                                               |
|     /event    | POST   |                                        Event registration. you need to sendo to server, date, name, description, image_url, value, address, contact, type in  the message body                                        |
|     /auth     | POST   |                                                                    Email registration. Requires email, password, and password_confirmation params.                                                                    |
|    /sign_in   | POST   | Email authentication. Requires email and password as params. This route will return a JSON representation of the User model on successful login along with the access-token and client in the header of the response. |

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
