# Teletipo
<p align="center">
  <a href="https://github.com/emilianox/Teletipo">
    <img height="300" width="300" src="https://cdn.rawgit.com/emilianox/Teletipo/master/images/teletipo.min.svg?raw=true">
  </a>
  <p align="center">A microframework between google app script(GAS) and telegram API for simple telegram Bots</p>
</p>


**Glosary**
 gas = google app script

# Install
**One time for all bots**
-   configure [toffeescript](https://githhttps://github.com/danthareja/node-google-apps-scriptub.com/jiangmiao/toffee-script)
-   configure [node-google-apps-script](https://github.com/danthareja/node-google-apps-script)

**First time when create each bot**

- clone this repo
- create in https://script.google.com your project
- create bot in https://web.telegram.org/#/im?p=@BotFather
- paste ***project_name***,***id_gapps***, ***secret*** in _config.coffee

```coffeescript
  googleAppScript:
    project_name : ""
    id_gapps : ""
  secret:""
```
*project_name* : the name of the the project in de *gas* editor

*id_gapps*: from "https://script.google.com/d/**ID_GAPPS IS HERE**/edit?splash=yes"

*secret*: in [BotFather](ttps://web.telegram.org/#/im?p=@BotFather) the token to access :
> Ex. **22465655206:ZYGPndgYE5Ejs8e6_9pujKywTgHKDvGu-Cp**

- run (into proyect folder) ```toffee push.coffee```
- edit frontend/commands.coffee
- edit test/frontend.coffee
- run (into proyect folder) ```toffee push.coffee```
- go to  Publish > Deploy as web app. [Guide](https://developers.google.com/apps-script/guides/web#deploying_a_script_as_a_web_app)
>- Execute the app as **your username**
>- Who has access to the app "Anyone, even anonymous"
>- Click Deploy.
> - Will show a url (the url should look like this https://script.google.com/macros/s/*****/exec)
- in gas editor run ```setTelegram``` function in init file
- profit!

**When edit**

- run (into proyect folder) ```toffee push.coffee```
- edit frontend/commands.coffee
- edit test/frontend.coffee
- run (into proyect folder) ```toffee push.coffee```
- go to  Publish > Deploy as web app. [Guide](https://developers.google.com/apps-script/guides/web#deploying_a_script_as_a_web_app)
>- Execute the app as **your username**
>- Who has access to the app "Anyone, even anonymous"
>- Click Deploy.
> - Will show a url (the url should look like this https://script.google.com/macros/s/*****/exec)
- in gas editor run ```setTelegram``` function in init file
- profit!
