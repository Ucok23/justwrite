<!--
This file contains instructions for AI coding agents. For more information,
see: https://aka.ms/vscode-instructions-docs
-->
# Justwrite AI Coding Conventions

Welcome, AI agent! This document will help you understand the Justwrite codebase and contribute effectively.

## Project Overview

Justwrite is a minimalist application for writing books, inspired by 37signals' Writebook. It allows authors to write books chapter by chapter using Markdown, with flexible authentication options.

### Key Features

- **Book & Chapter Management**: Create and organize books and chapters.
- **Markdown Content**: Chapters are written in Markdown.
- **Flexible Authentication**: Books can be public, private (require login), or partially private (specific chapters require login).

## Architecture

This is a standard Ruby on Rails application. Here's a quick overview of the key components:

- **Backend**: Ruby on Rails 8.1
- **Frontend**: Hotwire (Turbo, Stimulus), Tailwind CSS, and Importmap for JavaScript module management.
- **Database**: SQLite3 is used for development, test, and production.
- **Background Jobs**: Solid Queue for processing background tasks.
- **Caching**: Solid Cache for efficient data caching.
- **Websockets**: Solid Cable for real-time features.
- **Deployment**: Kamal for containerized deployments.

### Directory Structure

- `app/models`: Contains the application's models, which represent the data and business logic.
- `app/views`: Holds the templates for rendering the user interface.
- `app/controllers`: Manages the application's flow and handles user requests.
- `app/javascript`: Contains the application's JavaScript files, managed by Importmap.
- `app/assets/stylesheets`: Holds the application's stylesheets, which are processed by Tailwind CSS.

### Important Files

- `Gemfile`: Manages the application's dependencies.
- `config/routes.rb`: Defines the application's routes and URL structure.
- `Procfile.dev`: Specifies the processes to run in the development environment.
- `bin/dev`: The entry point for starting the development server.

## Developer Workflow

### Getting Started

1. **Install Dependencies**: Run `bundle install` to install the required gems.
2. **Start the Development Server**: Use `./bin/dev` to start the Rails server and Tailwind CSS watcher.

### Running Tests

- **Run all tests**: `bin/rails test`
- **Run system tests**: `bin/rails test:system`

### Linting

- **Run RuboCop**: `bundle exec rubocop`

## Conventions and Patterns

### Models

- **User**: The `User` model uses `has_secure_password` for authentication.
- **Book**: Represents a single book. It may have a setting to control whether all its chapters require authentication by default.
- **Chapter**: Belongs to a `Book` and contains the main content in Markdown. It has an attribute to control per-chapter authentication, allowing for public, private, and partially private books.

### Controllers

- **Authentication**: The `ApplicationController` likely contains logic to handle user sessions.
- **BooksController**: Handles CRUD operations for books.
- **ChaptersController**: Handles CRUD for chapters. This is where the primary authentication logic resides, checking if a chapter or its parent book requires a user to be logged in.

### Views

- **Hotwire**: We use Turbo Frames and Streams to create a responsive and fast user experience.
- **Stimulus**: We use Stimulus for client-side interactivity.
- **Tailwind CSS**: We use Tailwind CSS for styling.

## Integration Points

- **External APIs**: None at the moment.
- **Third-Party Services**: None at the moment.
