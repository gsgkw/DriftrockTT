# Driftrock Tech Test

##Requirements##

Create a script that can be run from the command line and can answer the questions listed below. The script accepts one parameter to specify which question it will answer and in some cases an optional argument. The script will print the answer to the console output.

  ruby app.rb COMMAND PARAMETERS

- total_spend [EMAIL]: What is the total spend of the user with this email address [EMAIL]?
- average_spend [EMAIL]: What is the average spend of the user with this email address [EMAIL]?
- most_loyal: What is the email address of the most loyal user (most purchases)?
- highest_value: What is the email address of the highest value user?
- most_sold: What is the name of the most sold item?


##Solution##

The script can be run from the command line. Arguments passed to the script from the command line via ARGV trigger the appropriate methods in the Controller module.

The solution is slow when working with the 40001 purchase records and 11001 user records returned by API; in hindsight, it might have been better to do a single API call and work with a persistent local database. I originally went with the multiple API calls because I thought it would minimise the risk of the data being out of date/behind.

The API call, data fetching and analysis have been split out into separate classes. I have tried to keep the classes small, without duplicating code between them.

###Architecture###

As a rough guide: app.rb acts as the command line interface; it talks to controller.rb, which instantiates and calls methods on the appropriate classes. get_data.rb contains all the classes pertaining to the API call and data parsing. All other files are named appropriately and do, hopefully, what it says on the tin.


###Setup and Use###

Run bundle install

Navigate to lib folder and run in command line

  ruby app.rb COMMAND PARAMETERS


###Results###

ruby app.rb most_sold
"Enormous Leather Bottle"

ruby app.rb highest_value
"bogisich_judah@hilperttromp.biz"

ruby app.rb most_loyal
"bogisich_judah@hilperttromp.biz"

ruby app.rb average_spend "bogisich_judah@hilperttromp.biz"
66.22133333333333

ruby app.rb total_spend "bogisich_judah@hilperttromp.biz"
993.32

###Tests###

run tests with RSPEC

COVERAGE:  97.24% -- 176/181 lines in 12 files

getting data
  GetUserData
    can return array of users
  GetPurchasesData
    can return array of purchases
  DataFetcher
    can return array of hashes

ItemTracker
  can display most frequent item

LoyaltyTracker
  can display most frequent customer

SpendTracker
  can display customer total spend
  can display customer average spend

UserFinder
  can return user id from email
  can return email from user id

ValueTracker
  can display most valuable customer id

##Comments##ß

Unsure is this is my error or a problem with the test but the keys in the example hash provided are symbols, whereas the keys returned by the API were strings.

{
"data": [
{
"id": "12DF-2324-GA2D-31RT", "first_name": "Drift", "last_name": "Rock",
"phone": "0-200-100-1234", "email": "drift.rock@email.com"
},
... ]
}


{
"data": [
{
"user_id": "12DF-2324-GA2D-31RT", "item": "Huge pineapple pizza", "spend": "19.99"
}, {"user_id": "12DF-2324-GA2D-31RT", "item": "A nice cup of tea", "spend": "2.99"
} ]
}
