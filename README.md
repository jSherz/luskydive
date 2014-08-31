Leeds Uni Skydivers
===================

Rails website for the Leeds Uni Skydivers society.

MoSCoW
------

### Must have

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

### Should have

- [x] Social links
- [ ] Google analytics code
- [x] Video on autostart (to add after development)
- [ ] Ability to upload images for committee members

### Could have

- [ ] Dropdown capability for navbar
- [ ] Tab categories in navbar dropdown list
- [ ] FAQ category URL slug (to replace ID)
- [ ] Fake tabs on the FAQ page (better than a list)

### Would have

- [ ] Latest tweets and/or status. On homepage?

Configuration
-------------

### Figaro environmental variables (config/production.yml)

- Extended oauth token (user, not application) to use when getting events:

        facebook_access_token

- Application secret when querying FB API:

        facebook_app_secret

- Connection string for the application DB (MySQL):

        database_url

- Rails secret key base:

        secret_key_base

- mailgun settings (SMTP):

        smtp_port
        smtp_server
        smtp_login
        smtp_password

- Keys for devise to use when generating session tokens & encrypting passwords etc

        devise_secret_key
        devise_pepper
