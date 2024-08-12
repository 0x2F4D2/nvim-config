return {
  'navarasu/onedark.nvim',
  opts = {
    style = 'dark',
  },
  config = function (_, opts)
    require('onedark').load(opts)
  end
}
