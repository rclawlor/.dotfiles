return {
    dir = "~/Personal/regex-railroad.nvim",
    -- "rclawlor/regex-railroad.nvim",
    tag = "v0.0.1",
    config = function()
       require("regex-railroad").setup({
            highlight = {
                bold = true,
                fg = "#CC6666"
            },
            dev = true
        })
    end
}
