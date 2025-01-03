return {
  {
    'echasnovski/mini.indentscope',
    version = '*',
    config = function()
      local set = require('mini.indentscope')
      set.setup({
        draw = {
          delay = 0,
          animation = set.gen_animation.none()
        },
      })
    end
  },
}
