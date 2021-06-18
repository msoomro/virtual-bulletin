Virtual Bulletin

A web application that allows users to CRUD bulletin boards and posts.


To run the application locally, download the code and create a .env file in the project's root directory with the following:
```
SESSION_SECRET=<Your Secret Here>
```

In the terminal, cd into the project directory and install the gems in the gemfile with the following command:
```
bundle install
```

Then run shotgun
```
shotgun
```

The first line returned should state something similar to: `== Shotgun/Thin on http://127.0.0.1:####/`, where #### represents the number of a port. Open a browswer window and type `localhost:####` into the URL bar, but replace `####` with the actual port number.

You are now running Virtual Bulletin locally.