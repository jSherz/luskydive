== Leeds Uni SkydiversS

Rails website for the Leeds Uni Skydivers society.

=== MoSCoW

==== Must have

- [x] Homepage /w video
- [x] FAQ page
- [x] Admin CRUD for all models
- [x] Members page showing committee
- [x] Contact us page
- [ ] Learn to skydive page
- [ ] Book a skydive page
- [x] Events loaded from FB group
- [ ] Entire site responsive / mobile friendly
- [ ] Tests!

==== Should have

- [x] Social links
- [ ] Google analytics code
- [x] Video on autostart (to add after development)
- [ ] Ability to upload images for committee members

==== Could have

- [ ] Dropdown capability for navbar
- [ ] Tab categories in navbar dropdown list
- [ ] FAQ category URL slug (to replace ID)
- [ ] Fake tabs on the FAQ page (better than a list)

==== Would have

- [ ] Latest tweets and/or status. On homepage?

=== Configuration

==== Figaro environmental variables (config/production.yml)

* facebook_access_token -> extended oauth token (user, not app) to use when making requests
* facebook_app_secret -> application secret for making requests
* database_url -> connstring for MySQL DB
* secret_key_base -> Rails secret key base
* mailgun_smtp_port -> SMTP server port
* mailgun_smtp_server -> SMTP server hostname
* mailgun_smtp_login -> SMTP server login
* mailgun_smtp_password -> SMTP server password
* devise_secret_key -> key for devise to use when generating session tokens etc
* devise_pepper -> devise secret for password encryption
