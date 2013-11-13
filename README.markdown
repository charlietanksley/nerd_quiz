# Nerd Quiz

Nerd Quiz is two things.

Officially it is an app that will let nerds at [Big Nerd Ranch][BNR]
quiz themselves to learn (or confirm that they know) the names of
fellow nerds.

Unofficially, it's an app to encourage experiments.  Right now the
backend is incomplete but is written in Ruby (using Rails 4), and the
frontend is being written in [Ember][ember] using [Lineman][lineman].
My thinking is that eventually I (or 'we', for anyone else who wants
to get involved) will actually write the backend as a small handful of
services using different languages.  But we'll see how that goes.

# Contributing

## To the backend:

The backend is pretty straighforward so far.  To bootstrap, do the
following:

1. Copy `config/database.yml.example` to `config/database.yml`.
2. `bundle install`.
3. Install Redis (on a Mac you can use Homebrew: `brew install redis`
then follow the instructions).

## To the frontend:

The frontend is totally divorced from the backend.  So you don't have
to do any of the above.  You do need a version of Ruby installed.
Then:

1. Make sure nodejs and npm are installed (on a Mac you can do this
with Homebrew: `brew install nodejs`).
2. Install the `sass` gem.  To do that *either*:
     * Make sure Bundler is installed (`gem install bundler`), then
      `bundle install`.
     * Just run `gem install sass`.
3. Install lineman: `npm install -g lineman`
4. From inside the `frontend` directory, run `npm install` to build
all npm dependencies.
5. From inside the `frontend` directory, run `lineman run` to start the
server.  (If you've never used Lineman, it might be worth scanning
[their homepage][lineman] to get a feel for how it works.)


[BNR]:http://www.bignerdranch.com/index
[ember]:http://emberjs.com
[lineman]:http://www.linemanjs.com