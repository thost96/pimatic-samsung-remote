module.exports = (env) ->

  Promise = env.require 'bluebird'
  _ = env.require 'lodash'
  remotelib = require 'samsung-remote'
  
  class SamsungRemote extends env.plugins.Plugin

    init: (app, @framework, @config) =>

      deviceConfigDef = require("./device-config-schema")
      @framework.deviceManager.registerDeviceClass("SamsungTvControl", {
        configDef: deviceConfigDef.SamsungTvControl,
        createCallback: (config) => new SamsungTvControl(config, @)
      })    

  class SamsungTvControl extends env.devices.ButtonsDevice

    constructor: (@config, @plugin) ->  
      @id = @config.id
      @name = @config.name  
      @debug = @plugin.config.debug 
      @buttons = @config.buttons
      @ip = @config.ip
      if @debug
        env.logger.debug @ip
      @remote = new remotelib({
        ip: @ip
      })
      Promise.promisifyAll @remote
      if @debug
        @remote
      super(@config) 

    destroy: () ->
      super()

    sendKey: (key) ->
      @remote.sendAsync(key).then( (result) ->
        env.logger.debug result
      ).catch( (err) ->
        env.logger.warn err
      )

    buttonPressed: (buttonId) =>
      for b in @config.buttons
        if b.id is buttonId
          env.logger.debug b.id
          @_lastPressedButton = b.id
          @emit 'button', b.id

          @remote.isAliveAsync().then( (err) =>
            unless err
              env.logger.debug "tv online"
              @sendKey(b.id)
          ).catch( (err) ->
            env.logger.warn "tv is offline"
          )
          return true
      throw new Error("No button with the id #{buttonId} found")

  return new SamsungRemote