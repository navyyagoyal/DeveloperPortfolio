# API Summary

## What is a REST API?
A REST API is a way for one program to ask another program for data over the internet. You send a request to a URL (like https://api.github.com/users/navyyagoyal) using an HTTP method such as GET, and the server sends back the data, usually in JSON format. I used it to fetch my GitHub profile and some sample posts without opening any website.

## HTTP Status Codes Observed
- **200 (OK):** the request worked and the server sent back the data. When I requested my own profile, curl -i https://api.github.com/users/navyyagoyal returned HTTP 200.
- **404 (Not Found):** the server could not find what I asked for. When I requested a username that does not exist (this-user-should-not-exist-12345), GitHub returned HTTP 404.

## jq Filter Used
The command I used was:

    cat API/github_profile.json | jq '{name:.name, repos:.public_repos, followers:.followers, joined:.created_at}'

What each part does:
- cat API/github_profile.json prints the saved JSON file.
- The pipe | sends that output into the next command.
- jq is a tool for reading and filtering JSON.
- The curly braces { } build a new, smaller JSON object with only the fields I want.
- name:.name takes the name field from the profile and keeps the label name.
- repos:.public_repos takes the number of public repositories and labels it repos.
- followers:.followers takes my follower count.
- joined:.created_at takes the date my account was created and labels it joined.

I also ran cat API/sample_posts.json | jq length, which counts the items in the list of posts. It printed 100.
