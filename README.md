# LofoCats UI

LofoCats is a simple application, consuming the [LofoCats API](https://github.com/iridakos/lofocats_api), built with Ruby on Rails for demo purposes.

![Cat entries index](https://3.bp.blogspot.com/-6KEEbALF9c8/VgLFrtF5hoI/AAAAAAAABcI/_QbpgDMU-1c/s1600/cat-entries-index.png)

## Functionality

* Guests may browse for lost & found cat entries.
* Signed in users may create, update or delete their cat entries.
* Administrators may manage the application's users & create/update/delete any cat entry.

## Setting up the application

* Clone the repository.
* Execute <code>bundle install</code> to install required gems.
* Edit the <code>config/api.yml</code> and update it with the URL of the LofoCats API. By default, the applications will use <code>http://localhost:3001</code>
* Execute <code>rails server</code> to start the application on the default port.
* Navigate to [the application's home page](http://localhost:3000) and there you are. For signing in, view  the documentation of the [LofoCats API](https://github.com/iridakos/lofocats_api) to obtain the credentials of the user that you want to use.

## Behind the scenes

* **Zurb Foundation**: Responsiveness & styling
* **CanCan**: Authorization
* **RestClient**: Talk with the API
* **FontAwesome**: Font icons used in some links

## Screenshots

### Administrator Home Page

![Administrator home page](https://3.bp.blogspot.com/-5qYmXhpKK3U/VgLFrKEj6PI/AAAAAAAABcA/4MN4Q2DoNrQ/s1600/administration.png)

___

### Guest Home Page

![Guest home page](https://4.bp.blogspot.com/-ZYPlyBQxPD4/VgLFrVrq6II/AAAAAAAABcE/7H-saMqtndE/s1600/home-page.png)

___

### User Administration

![User administration](https://4.bp.blogspot.com/-lG9wkrWnsZg/VgLFrxJbM1I/AAAAAAAABcM/BPEElFJ9VXs/s1600/manage-users.png)

___

### Cat Entry Form

![Cat entry form](https://2.bp.blogspot.com/-5p3FZM9TAMo/VgLFsbX4SVI/AAAAAAAABcQ/Xo8QC4ARJCk/s1600/new-cat-entry.png)

___

### Cat Entry Show Page

![Cat entry show page](https://2.bp.blogspot.com/-msWKssP6JAM/VgLFsnma-KI/AAAAAAAABcU/GavocZB-beQ/s1600/show-cat-entry.png)

___


### Sign In Page

![Sign in page](https://3.bp.blogspot.com/-MzJWWudn7W0/VgLFtClADQI/AAAAAAAABcY/o0HBx76_-1M/s1600/sign-in.png)

___

### Cat Entry Show Page for Mobiles

![Cat entry show page for mobiles](https://2.bp.blogspot.com/-HToFMV8j9hs/VgLGVh1jNZI/AAAAAAAABc8/qoQG2o95b-U/s1600/mobile-cat-entries-index.png)

___

### Sign in Page for Mobiles

![Sign in page for mobiles](https://4.bp.blogspot.com/-8hGbaqUvHn0/VgLGVqKtNRI/AAAAAAAABc4/fe5St4o8OYc/s1600/mobile-sign-in.png)
