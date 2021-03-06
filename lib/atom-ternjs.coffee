Manager = require './atom-ternjs-manager'
Provider = require './atom-ternjs-provider'

module.exports =

  manager: null
  provider: null

  # config
  config:
    guess:
      title: 'Guess'
      description: 'When completing a property and no completions are found, Tern will use some heuristics to try and return some properties anyway. Set this to false to turn that off.'
      type: 'boolean'
      default: true
      order: 0
    sort:
      title: 'Sort'
      description: 'Determines whether the result set will be sorted.'
      type: 'boolean'
      default: true
      order: 1
    caseInsensitive:
      title: 'Case-insensitive'
      description: 'Whether to use a case-insensitive compare between the current word and potential completions.'
      type: 'boolean'
      default: true
      order: 2
    useSnippets:
      title: 'Use autocomplete-snippets'
      description: 'Adds snippets to autocomplete+ suggestions'
      type: 'boolean'
      default: true
      order: 3
    useSnippetsAndFunction:
      title: 'Display both, autocomplete-snippets and function name'
      description: 'Choose to just complete the function name or expand the snippet'
      type: 'boolean'
      default: false
      order: 4
    inlineFnCompletion:
      title: 'Display inline suggestions for function params'
      description: 'Displays a inline suggestion located right next to the current cursor'
      type: 'boolean'
      default: true
      order: 5
    documentation:
      title: 'Documentation'
      description: 'Whether to include documentation string (if found) in the result data.'
      type: 'boolean'
      default: true
      order: 6
    urls:
      title: 'Url'
      description: 'Whether to include documentation urls (if found) in the result data.'
      type: 'boolean'
      default: true
      order: 7
    origins:
      title: 'Origin'
      description: 'Whether to include origins (if found) in the result data.'
      type: 'boolean'
      default: true
      order: 8
    coffeeScript:
      title: 'CoffeeScript'
      description: 'Completions for CoffeeScript. Please restart atom after activating/deactivating this option (highly experimental)'
      type: 'boolean'
      default: false
      order: 9

  activate: (state) ->
    @provider = new Provider()
    @manager = new Manager(@provider)

  deactivate: ->
    @manager.destroy()
    @manager = null

  provide: ->
    @provider
