# Term Deposit Calculator

By Tessa Podbury

## Instructions
1. Ensure your machine has Ruby 3.3.0 installed.
2. Clone repo
3. From the root of the repo, run `bundle install`
4. Run command `chmod +x lib/term_deposit_calculator.rb`.
5. To start the app, run command `ruby lib/term_deposit_calculator.rb`.
6. To run the tests, run command `rspec -fd`

## Assumptions
Based on the brief to focus less on the UI, the vast majority of my time was spent on the backend logic and testing. The entry class/CLI functionality was a fast and dirty last minute addition due to the timeframe given - this is definitely not up to standard.

## Design Decisions
### Request Validation Layer
I wanted to have a clear separation of concerns between the backend and frontend and ensure that validation occurred at the entry point regardless of the client and it's behaviour. This also allows for a clear separation of concerns between the error handling of request parameters and the logic of the calculation classes, making them simple and easy to test.

### Base Term Deposit Calculator
Initially, I decided to do a Base Calculator class due to the interest multiplier in the interest algorithm being different depending on whether the user selected maturity for the interest payment frequency or not. Rather than handling it in the one class, I thought it would be cleaner and nicer to test if they were separate. I was pretty quickly in two minds about this decision, both in the way I implemented it and if it was a case of over engineering something unnecessary. If I had more time I would rethink the way I have implemented the Builder, and whether that should have snuck into the layer of the handler, or, whether there was a cleaner way to encapsulate this idea within the Base Term Deposit Calculator. My other gripe with my implementation is that in separating the logic between the Base Calculator and it's children, the actual algorithm gets lost and isn't obvious without jumping between classes. 