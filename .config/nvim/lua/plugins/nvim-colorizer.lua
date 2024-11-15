return {
	"norcalli/nvim-colorizer.lua",

	config = function()
		require("colorizer").setup({
            css = {
                names = false,
            },
			javascript = {
                names = false
            },
			html = {
                names = false
			},
		})
	end,
}
