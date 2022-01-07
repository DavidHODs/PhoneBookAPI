# README

Built in Ruby 2.7.5p203, Rails 7.0.0
Uses Postgres

Available endpoints:
http://localhost:3000/contact_apps [POST]
This endpoint takes 6 parameters. If any of the parameters are missing, it will return an unprocessable entity error (I know the response does not properly show the error, still figuring out ruby and rails).

Example:
{
	"firstname": "Uncle",
	"lastname": "Lake",
	"age": 30,
	"sex": "male",
	"address": "ij",
	"phonenumber": "67893"
}

http://localhost:3000/contact_apps [GET]
This returns all the contact detail data in the database

http://localhost:3000/contact_apps/id [GET]
This returns a contact detail

http://localhost:3000/contact_apps/id [PATCH/PUT]
This endpoint updates the details of a saved contact

Example:
{
	"firstname": "Mister",
	"lastname": "River",
	"age": 120,
	"sex": "female",
	"address": "kl",
	"phonenumber": "349-0938-098"
}

http://localhost:3000/contact_apps/id [DELETE]
This endpoint deletes a saved contact