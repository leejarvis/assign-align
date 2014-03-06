module.exports =
  activate: ->
    atom.workspaceView.command 'assign-align:align', ->

      editor = atom.workspaceView.getActivePaneItem()
      range  = editor.getSelectedBufferRange()
      text   = editor.getSelectedText()
      lines  = text.split("\n")

      max = 0
      for line in lines
        len = line.replace(/^\s+|\s+$/g, "").split('=')[0].length
        max = len if len > max

      for line in lines
        key = line.replace(/^\s+|\s+$/g, "").split('=')[0]
        newkey = key + Array((max - key.length) + 1).join(" ")
        text = text.replace(key, newkey)

      editor.setTextInBufferRange(range, text)
