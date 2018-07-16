# README

__Ruby version: 2.4.1__


__Quick Start:__
  * After cloning down the repo run ``rake db:{create,migrate}`` 
  * In order to play a game, both users must register by visiting the home page and responding to the verification email. 
  * all game requests to the api will require the users api key in the headers under ``X-API_Key: your-api-key``

__EndPoints__

* `POST /api/v1/games` - `player_1` creates a game by sending over their API key and `player_2`'s email address. Both players should already exist in the system.
* `POST /api/v1/games/:game_id/ships` - Place a ship on the requesting player's board. Player is determined by the API key sent. Should only allow players who are part of this game.
* `POST /api/v1/games/:game_id/shots` - Send a `target` coordinate to fire upon the opponents board. Sender is determined by the API key that is sent over. Should only allow players who are part of this game. Should not allow a user to fire when it is not their turn.
