# README

Movie Review Website

Features missing in MVP
- link to reviewed object in review

Potential Improvements:
- reviews show could link to itself with either "view full review" if on the film or actor page, but to the title of the reviewable otherwise (can do this with passing @review_object = true where you just want the "view full review" link)

Stretch feature
- Trusted reviewer can delete other users' comments and ratings

Fixed Issues:
- No actor show page
- User can't delete own film comments
- Rating needs to be rounded down
- Rating needs to be validated to be an integer
- No validations to prevent user from making a rating over 5
- When unregistered users visit unauthorized pages server will give errors
