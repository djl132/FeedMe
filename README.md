# README

FeedMe is a small project I used to learn push notifications libraries like stream.io.
FeedMe allows you to post things, follow other users, and pin posts. All such activity is recorded in flat feeds.
And all following activity is recorded by notifications feed and aggregated feed. 

## Configuration

``` bundle ```

```rails db:migrate```

Use figaro gem to securely store streamio authenticaion information (keys and secrets), for example. 

```figar install```

Terminal should look like this:

```
Dereks-MacBook-Pro:FeedMe DerekJLin$  figaro install
      create  config/application.yml
      append  .gitignore
```
Add keys into application.yml. 

Done.
