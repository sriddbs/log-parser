# Log Analyzer

# Problem Statement
  The log file contains all requests to a server within a specific timeframe. Given the following endpoints:

  * GET /api/users/{user_id}/count_pending_messages
  * GET /api/users/{user_id}/get_messages
  * GET /api/users/{user_id}/get_friends_progress
  * GET /api/users/{user_id}/get_friends_score
  * POST /api/users/{user_id}
  * GET /api/users/{user_id}

  Where {user_id} is the id of the user calling the backend.

  Write a command line program that outputs a small analysis of the sample log containing at least the following:

  For each of the URLs above:

  * The number of times the URL was called.
  * The mean (average), median and mode of the response time (connect time + service time).
  * The "dyno" that responded the most.

  The output should just be simple text lines. Note that we want aggregate data for all users, not stats on specific users.

# How to Run

ruby lib/log_analyser.rb

# Output
```
**************************************************
GET /api/users/{user_id}/count_pending_messages
**************************************************
Requests: 2430
Mean: 25.99670781893004
Median: 15.0
Mode: 11
Popular dyno: web.2
**************************************************
GET /api/users/{user_id}/get_messages
**************************************************
Requests: 652
Mean: 62.170245398773005
Median: 32.0
Mode: 23
Popular dyno: web.11
**************************************************
GET /api/users/{user_id}/get_friends_progress
**************************************************
Requests: 1117
Mean: 111.89704565801253
Median: 51
Mode: 35
Popular dyno: web.5
**************************************************
GET /api/users/{user_id}/get_friends_score
**************************************************
Requests: 1533
Mean: 228.7651663405088
Median: 143
Mode: 67
Popular dyno: web.7
**************************************************
POST /api/users/{user_id}
**************************************************
Requests: 2022
Mean: 82.77546983184965
Median: 46.0
Mode: 23
Popular dyno: web.11
**************************************************
GET /api/users/{user_id}
**************************************************
No requests made to the URL
```
# Tests
```
rspec

Finished in 0.03643 seconds (files took 0.63652 seconds to load)
9 examples, 0 failures
```
