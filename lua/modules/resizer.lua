local vim = vim --> Use locals
local eval = vim.api.nvim_eval
local ft = vim.bo.ft

local M = {}
function M.split_resizer(config) --> Only resize normal buffers, set qf to 10 always
    if eval('g:enabled_focus') == 0 then return end -- not sure if this is needed now
    -- if ft == config.excluded_filetypes then return end --TESTING, NEEDS CONFIRMATION
    if ft == vim.tbl_contains(config.excluded_filetypes, ft) then return end -- None of this works. Why?
    if ft == 'qf' then
        vim.o.winheight = 10 return -- qf height is 10 default
    else
        vim.o.winwidth = config.width --> lua print(vim.o.winwidth)
    end
    if config.height ~= 0 then vim.o.winheight = config.height --> Opt in to set height value, otherwise auto-size it
    end
end

return M
