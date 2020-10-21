# Basic config server to avoid hardcoding in iOS applications

This is the source code for my article titled ["Basic config server to avoid hardcoding in iOS applications"](http://michalcichon.github.io/ios/2020/10/17/basic-config-server-to-avoid-hardcoding-in-ios-app.html)

## How to run it
> You will need Node.js, npm, MariaDB and Xcode.
1. Open BasicConfigServer: `cd BasicConfigServer`
2. Install dependencies: `npm install`
3. Install MariaDB and create database based on `Database/db.spf` file.
4. Change configuration in `BasicConfigServer` to reflect your credentials.
5. Run the backend application: `node server.js`
6. Open BasicConfigClient project in Xcode.
