express = require 'express'
path = require 'path'


module.exports = (initFn)->
    app = express()

    module.exports.static_route
    app.configure ->
        app.set('port', process.env.PORT || 8080);
        app.use(express.favicon())
        app.use(express.methodOverride())
        app.use(express.bodyParser());
        app.use(express.limit('2mb'));

    app.configure 'development', ->
        app.use express.logger({ format: 'short' })
        app.use express.errorHandler()

    app.configure ->
        app.use(express.cookieParser())
        module.exports.static_route = path.join __dirname, 'public'
        app.use(express.static(path.join(__dirname, 'public')))
        app.use(app.router)


    #Init Routes
    require('./routes')(app, module.exports.static_route)

    if initFn?
        http = require 'http'
        server = http.createServer app
        server.listen app.get('port'), initFn
    app
