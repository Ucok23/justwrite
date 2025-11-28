# Justwrite

Justwrite is a minimalist application for writing books, inspired by 37signals' Writebook. It allows authors to write books chapter by chapter using Markdown, with flexible authentication options.

## Status

Active Development, all required features not 100% ready.

## Ruby Version

This project uses Ruby version `3.4.7`.

## System Dependencies

- **SQLite3**: The application uses SQLite3 as its database.

## Getting Started

1. **Install Dependencies**: Run `bundle install` to install the required gems.
2. **Start the Development Server**: Use `./bin/dev` to start the Rails server.

## Database

- **Database Configuration**: The database configuration is located in `config/database.yml`.
- **Database Creation**: To create the database, run `bin/rails db:create`.
- **Database Initialization**: To initialize the database, run `bin/rails db:setup`.
- **Database Migration**: To run migrations, use `bin/rails db:migrate`.

## How to Run the Test Suite

- **Run all tests**: `bin/rails test`
- **Run system tests**: `bin/rails test:system`

## Linting

- **Run RuboCop**: `bundle exec rubocop`

## Services

- **Background Jobs**: [Solid Queue](https://github.com/basecamp/solid_queue) for processing background tasks.
- **Caching**: [Solid Cache](https://github.com/basecamp/solid_cache) for efficient data caching.
- **Websockets**: [Solid Cable](https://github.com/basecamp/solid_cable) for real-time features.

## Deployment

Deployment is handled by [Kamal](https://kamal-deploy.org/), a tool for containerized application deployment.
