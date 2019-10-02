# CF Summit 2019 - Biggest Testing Bang for your Buck Demo

This is the demo ap from my presentation at CF Summit 2019.

## Slides

https://drive.google.com/file/d/1eyIuMuW_c_ZUCE5ud4x_5VGmAsXqQNhm/view


## CommandBox Dependencies

Run a `box install` to install all of the dependencies of the app.

You will also need some system modules, install the following

```
box install commandbox-cfconfig
box install commandbox-migrations
box install commandbox-dotenv
```

## DB Requirement

Create a db on a MySQL server with the file located in this gist.
https://gist.github.com/gpickin/1b21fae5acc4e0c19354011496cd8a77

## ENV files

Copy the `.env.example` file and name it `.env`
Change the host username and passwords so they match your system.

## Start the server

From the root folder in the app, run 

`box start`
