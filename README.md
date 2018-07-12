## Installing the Gulp Build Tools on a Mac
1. [Download and install Node.js](https://nodejs.org/download/)
2. Open Terminal.app
3. Select the theme directory:
    * ``> cd ~/YourLocalProjectFolder/themes/sc-bootstrap4``
4. Install the dependencies:
    * ``> sudo npm install gulp-cli -g``
    * ``> npm install --save-dev``
    * This will install 3 different packages:
        * gulp *which is our task runner.*
        * browser-sync *which will setup a static server and allow us to designate when the browser reloads as we save files.*
        * gulp-sass *which will compile our .scss files into .css files.*
    * The option *--save-dev* will save these packages as development dependencies.
5. Setup your local gulp settings (see next step)

## Setting Up the Gulp Settings

1. Use the gulp settings template file (gulp.settings.tpl.js) to for your local configuration,
    * ``> copy gulp.settings.tpl.js gulp.settings.js``
2. Enter your local settings
    * ```javascript
module.exports = {
   SASS_SRC:  "client/scss",
   CSS_DIR:   "client/css",
   JS_DIR:    "client/js",
   PROXY_URL: "http://my.dev.domain.tld"
};
```
    * *PROXY_URL* should be enough in most cases and is only necesary if you want to use browser based watch support.

## Executing the Sass Build Tools using Gulp on a Mac

* Start gulp server:
    * ``> gulp``
* Compile CSS files:
    * ``> gulp sass``
* Watch Sass files to automatically compile CSS when changing a Sass file:
    * ``> gulp sass:watch``
* Prefix CSS using Autoprefixer:
    * ``> gulp prefixcss``
* Sync CSS files with a local HTTP host:
    * ``> gulp sync``
* Start a local browserSync server:
    * ``> gulp serve``

To terminate gulp task you need to press CTRL + C.