# User ID Bug Demo Project
## Overview
Some time after updating the iOS Mixpanel SDK from v3.1.7 to v4.0.4 we noticed a huge uptick in new users. After investigating, we discovered that the Mixpanel SDK has assigned new user IDs to **all** existing users.
This demo project demonstrates the bug.

## Description
We have replicated the Mixpanel integration in our apps line-for-line while removing all project-related prioprietary code.

There are two Mixpanel projects to which we’re sending data.

To replicate the issue, do the following:

1. Check out the repo at the tag “Mixpanel-3.1.7”.
2. Build the demo project.
3. The user is assigned a user ID.
4. Check out the repo at the tag “Mixpanel-4.0.4".
5. Build the project again.
6. The user is (wrongly) assigned a new user ID.

Built with Xcode 14.1.
