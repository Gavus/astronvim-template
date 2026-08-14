if vim.g.vscode then
	vim.keymap.set("n", "<leader>uw", function()
		vim.fn.VSCodeNotify "editor.action.toggleWordWrap"
	end, { silent = true })

	local vscode_commands = {
		["<C-e>"] = "workbench.action.toggleSidebarVisibility",
		["<C-k>"] = "workbench.action.navigateUp",
		["<C-j>"] = "workbench.action.navigateDown",
		["<C-h>"] = "workbench.action.navigateLeft",
		["<C-l>"] = "workbench.action.navigateRight",
	}

	for key, command in pairs(vscode_commands) do
		vim.keymap.set("n", key, function()
			vim.fn.VSCodeNotify(command)
		end, { silent = true })
	end
end