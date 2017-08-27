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

|      Path     | Method |                                                          Purpose                                                          |
|:-------------:|:------:|:-------------------------------------------------------------------------------------------------------------------------:|
|     /event    |   GET  |                                    It returns all events that are register in database                                    |
|   /event/id   |   GET  |                                  It return the event specified by the id in url parameter                                 |
| /event/search |   GET  | In this endpoint you can pass specific parameters that will act as filters. Right now you can pass "name", and "user_id". |
|   /users/id   |   GET  |                                 It return the information about a specific user by its id                                 |
|   /academic   |   GET  |                                  It return all the academic events registered in database                                 |
