# Rack::MongoidAdapter
Provides RESTful interface for MongoDB as a rack middleware.

## Usage
```ruby
# config.ru
require "rack/mongoid_adapter"
Mongoid.load!("/path/to/mongoid.yml")
run Rack::MongoidAdapter.new
```

```sh
mongod --fork
rackup
```

## API
| Name    | Verb   | Path        | MongoDB                                                       |
| ---     | ---    | ---         | ---                                                           |
| Index   | GET    | /foobar     | db.foobar.find                                                |
| Show    | GET    | /foobar/:id | db.foobar.find(_id: id)                                       |
| Create  | POST   | /foobar     | db.foobar.insert(request.params["attributes"])                |
| Update  | PUT    | /foobar/:id | db.foobar.update(_id: id, $set: request.params["attributes"]) |
| Destroy | DELETE | /foobar/:id | db.foobar.remove(_id: id)                                     |

## Development
```sh
# setup
bundle install
mongod --fork

# testing
bundle exec rspec
```
