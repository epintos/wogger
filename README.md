# [Wogger]

Time logger for different projects and teams

## Quick Start

Install Node.js and then:

```sh
$ git clone git@github.com:Wolox/juryace.git
$ cd juryace
$ sudo npm -g install grunt-cli karma bower
$ npm install
$ bower install
$ grunt watch
```

Finally, open `file:///path/to/logger/build/index.html` in your browser.


## Build and test

```sh
$ grunt build
$ grunt chrome-test
$ grunt watch
```

### Overall Directory Structure

At a high level, the structure looks roughly like this:

```
logger/
  |- grunt-tasks/
  |- karma/
  |- src/
  |  |- app/
  |  |  |- <app logic>
  |  |- assets/
  |  |  |- <static files>
  |  |- common/
  |  |  |- <reusable code>
  |  |- less/
  |  |  |- main.less
  |- vendor/
  |  |- angular-bootstrap/
  |  |- bootstrap/
  |  |- placeholders/
  |- .bowerrc
  |- bower.json
  |- build.config.js
  |- Gruntfile.js
  |- module.prefix
  |- module.suffix
  |- package.json
```
