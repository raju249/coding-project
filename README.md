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
