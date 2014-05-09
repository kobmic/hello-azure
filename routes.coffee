
async = require 'async'
path = require 'path'

module.exports = (app, static_route) ->


    # Routes
    #
    app.get '/', (req,res) ->
        res.render 'index'

    app.get '/health', (req,res) ->
        res.send(200)

return {}
    
