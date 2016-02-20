# PhoenixGuardian

[![Build Status](https://travis-ci.org/hassox/phoenix_guardian.svg?branch=ueberauth-guardian)](https://travis-ci.org/hassox/phoenix_guardian)

Provides an example implementation for authentication in Phoneix applications
using Überauth and Guardian.

The main user model is `User` which has many `Authorization`s. This is done so
that for any given user they can have authorizations from different sources.
Github, Slack, Google, Facebook, Email/Password etc.

Once we have the user in the system - Guardian steps in to provide request
implementation.

The two systems, Überauth and Guardian, are independent and are used together in
this application for demonstration purposes.

To start your Phoenix app:

  1. Install dependencies with `mix deps.get && npm install`
  2. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  3. Start Phoenix endpoint with `mix phoenix.server`
  4. Duplicate the supplied .envrc.example file to an .envrc file and update the environment variables.
  5. (IMPORTANT) Before starting the project or running tests, make sure to run command `source .envrc` to load necessary ENV vars.
  5. Run the site with `foreman s -f Procfile.dev`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

To visit the admin site, after you've created a user you should flip the
"is_admin" boolean on the users table in the database.

Then visit [`localhost:4000/admin/users`](http://localhost:4000/admin/users)

## What to look for

The site is broken into two broad parts

1. Normal section - optionally logged in
2. Admin section - requires login of a user who is an admin

## License

Copyright (c) 2016 Michael Cloutier

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
