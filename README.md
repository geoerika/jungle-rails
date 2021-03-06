# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. Tested with RSpec.

## Final Product

### Main Page

!["Screenshot of Jungle main page"](https://raw.githubusercontent.com/geoerika/jungle-rails/master/images/Main.png)

### List of Categories under Admin Page

!["Screenshot of Categories under Admin page"](https://raw.githubusercontent.com/geoerika/jungle-rails/master/images/AdminCategories.png)

### Creating new categpry under Admin

!["Screenshot of CreatingNew Category page"](https://raw.githubusercontent.com/geoerika/jungle-rails/master/images/AdminNewCategory.png)

### Order Screen

!["Screenshot of Order page"](https://raw.githubusercontent.com/geoerika/jungle-rails/master/images/Order.png)

### Product Detail Screen

!["Screenshot of Product Detail page"](https://raw.githubusercontent.com/geoerika/jungle-rails/master/images/ProductDetails.png)

### Login Page

!["Screenshot of Jungle Login page"](https://raw.githubusercontent.com/geoerika/jungle-rails/master/images/Login.png)

### SignUp Page

!["Screenshot of Jungle signup page"](https://raw.githubusercontent.com/geoerika/jungle-rails/master/images/SignUp.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create config/database.yml by copying config/database.example.yml
4. Create config/secrets.yml by copying config/secrets.example.yml
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server
10. Open application: http://localhost:3000

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
Type in a future date for Credit Card expiry date

## Dependencies

* Rails 4.2.6 or above
* PostgreSQL 9.x
* Stripe
* Sass-rails 5.0 or above
* Uglifier 1.3.0 or above
* Coffee-rails 4.1.0 or above
* Therubyracer
* Jquery-rails
* Turbolinks
* Jbuilder 2.0 or above
* Sdoc 0.4.0 or above
* Bcrypt 3.1.7 or above
* Puma
* Bootstrap-sass 3.3.6 or above
* Font-awesome-rails
* Money-rails
* Carrierwave
* Rmagick
* Stripe
* Faker
