# Steps to install and run the project

1. Ensure you have Ruby and Rails installed on your system. This project was built using Ruby 3.3.4 and Rails 7.2.2.

2. Clone the repository.

3. Navigate to the project directory:
   ```
   cd coding-project
   ```

4. Install the required gems:
   ```
   bundle install
   ```

   4a. Set up credentials:
   ```bash
   # Generate a new credentials file and master key
   rails credentials:edit
   ```
   This will create:
   - config/credentials.yml.enc
   - config/master.key

   Note: Keep master.key secure and never commit it to the repository
   ```

5. Create and migrate the database:
   ```
   rails db:create
   rails db:migrate
   ```

6. Start the Rails server:
   ```
   rails s
   ```

The application should now be running at `http://localhost:3000`.

# API Endpoints

## Users

- GET /users - List all users
- GET /users/:id - Get user details
- POST /users - Create a new user
- PUT/PATCH /users/:id - Update a user
- DELETE /users/:id - Delete a user
- GET /users/:id/availabilities - Get user's availabilities
- POST /users/:id/set_availability - Set availability for a user
- GET /users/:id/find_overlap/:other_user_id - Find overlapping availabilities between two users

## Timezones

- GET /timezones - List all timezones

## Availabilities
- GET /availabilities - List all availabilities
- GET /availabilities/:id - Get availability details
- POST /availabilities - Create a new availability
- PUT/PATCH /availabilities/:id - Update an availability
- DELETE /availabilities/:id - Delete an availability

## Events

- GET /events - List all events
- GET /events/:id - Get event details
- POST /events - Create a new event
- PUT/PATCH /events/:id - Update an event
- DELETE /events/:id - Delete an event
- POST /events/:id/invite - Invite a user to an event
- POST /schedule_meeting/:user_id - Schedule a meeting with a user

## Invitations

- GET /invitations - List all invitations
- GET /invitations/:id - Get invitation details
- POST /invitations - Create a new invitation
- PUT/PATCH /invitations/:id - Update an invitation
- DELETE /invitations/:id - Delete an invitation

## Notifications

- GET /notifications - List all notifications
- PUT/PATCH /notifications/:id - Update a notification

--

# Harbor Take Home Project

Welcome to the Harbor take home project. We hope this is a good opportunity for you to showcase your skills.

## The Challenge

Build us a REST API for calendly. Remember to support

- Setting own availability
- Showing own availability
- Finding overlap in schedule between 2 users

It is up to you what else to support.

## Expectations

We care about

- Have you thought through what a good MVP looks like? Does your API support that?
- What trade-offs are you making in your design?
- Working code - we should be able to pull and hit the code locally. Bonus points if deployed somewhere.
- Any good engineer will make hacks when necessary - what are your hacks and why?

We don't care about

- Authentication
- UI
- Perfection - good and working quickly is better

It is up to you how much time you want to spend on this project. There are likely diminishing returns as the time spent goes up.

## Submission

Please fork this repository and reach out to Prakash when finished.

## Next Steps

After submission, we will conduct a 30 to 60 minute code review in person. We will ask you about your thinking and design choices.
