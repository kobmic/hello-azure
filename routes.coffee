
async = require 'async'
path = require 'path'

module.exports = (app, static_route) ->


    # Routes
    #
    app.get '/', (req,res) ->
        res.status(200).sendfile(path.join static_route, 'index.html')

    app.get '/health', (req,res) ->
        res.send(200)

return {}
    
