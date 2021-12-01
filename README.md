# Adnat (Ruby on Rails challenge)

![](https://i.imgur.com/w1YzNY6.png)

To set up project, execute the following commands:
```
git clone https://github.com/jooomin/workforce_techtest.git

bundle install

bin/rails db:create
bin/rails db:migrate
```

To start server:
```
rails s
```

To run tests:
```
bin/rails test
```

To run indvidual tests example:
```
bin/rails test test/models/organisation_test.rb
```
## How your app should work

The following illustrations should only serve as an example. You do not need to follow the designs presented below. You can split functionality out to other pages. Just make sure it is all there.

An unauthenticated user should first be prompted to log in, sign up, or reset their password:

Figure 2:

![](https://i.imgur.com/XLhRtL3.png)

As per Figure 1, users have names, so "Name" should be a field on your sign up page.

Figure 3:

![](https://i.imgur.com/yflhRac.png)

After signing up, users will not belong to an organisation, so when they log in for the first time, they should be prompted to join an organisation (or create a new one).

Figure 4:

![](https://i.imgur.com/V53XD3X.png)

Users should be able to edit all organisations (i.e. their names and their hourly rates).

Figure 5:

![](https://i.imgur.com/XMoFEzj.png)

Once a user has joined an organisation, the home page should change to become an overview of actions for that organisation: viewing shifts, editing the organisation, or leaving the organisation.

Figure 6:

![](https://i.imgur.com/7tZ9Gfc.png)

Leaving an organisation should return the user to the state they are in just after they sign up, i.e. not belonging to any organisations. The departed user's shifts should be deleted.


Finally, the shift page should show all shifts that belong to the user and their fellow employees at their organisation.

Figure 7:

![](https://i.imgur.com/3XS2mvP.png)

A few things to note:
* The hourly rate at Bob's Burgers in Figure 7 is $10/h.
* Your table should include all the columns in Figure 7, and should be ordered with the most recent shifts listed first.
* Breaks are considered unpaid and are thus subtracted from `shift length` to determine `hours worked` (which in turn determines `shift cost`):
  ```
  shift length = finish time – start time
  hours worked = shift length - break length in hours
  shift cost = hours worked * organisation hourly rate
  ```
  `shift length` doesn't need to be displayed in the table, but `hours worked` and `shift cost` do.
* You will need to incorporate a way of creating a new shift for the user that is logged in. As with everything else, you don't need to copy the way it was done in the screenshot above.
* As per Figure 1, shift date and start time are to be stored in the same database column. Separating the two (and joining them together when you create a shift) is an exercise left to the reader.

### Optional exercises
Here are some optional exercises for you to do. We recommend that you try at least one of them. They are all mutually compatible, so you could do all of them. Some will require changes to the structure of the database.

#### 1. Users details (easy)
Allow users to change their own name, email address, or password.

#### 2. Modifying/Deleting shifts (easy)
Allow users to modify or delete existing shifts.

#### 5. Overnight shifts (medium)
When creating a shift, if the finish time of a shift is earlier than the start time, the shift should be considered overnight. For example, if the start time is 7:30pm and the finish time is 1:30am, then it is an overnight shift that goes for 6 hours.

#### 9. Functional or Unit tests
Adding tests is a good idea. We don't mandate that you write any for this challenge, but feel free to go ahead and write some tests for your code.