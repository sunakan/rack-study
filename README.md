## Rack

```
$ make bash
```

```
$ bundle install
$ bundle exec rackup -o 0.0.0.0 -s puma
# とか
$ bundle exec rackup -o 0.0.0.0 -s puma config2.ru
# とか
$ bundle exec rackup -o 0.0.0.0 -s puma config3.ru
# とか
$ bundle exec rackup -o 0.0.0.0 -s puma config-with-middleware.ru
# とか
$ bundle exec rackup -o 0.0.0.0 -s puma config-lobster.ru
```

```
$ curl localhost:9292
```
