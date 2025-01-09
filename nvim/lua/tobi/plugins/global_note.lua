return {
    "backdround/global-note.nvim",
    config = function()

        local get_project_name = function()
            local result = vim.fn.system({
                'git',
                'rev-parse',
                '--show-toplevel'
            })
            
            if string.find(result, 'fatal') then
                vim.notify("Not a git repo", vim.log.levels.WARN)
                return nil
            end

            local project_directory = result

            local project_name = vim.fs.basename(project_directory)
            if project_name == nil then
                vim.notify("Unable to get the project name", vim.log.levels.WARN)
                return nil
            end

            return project_name
        end

        local global_note = require("global-note")
        global_note.setup({
            additional_presets =  {
                project_local = {
                    command_name = "ProjectNote",

                    filename = function()
                        project_name = get_project_name()
                        project_name = string.gsub(project_name,"\n", "")
                        if project_name == nil then
                            project_name = "NoPro"
                        end
                        return project_name  .. ".md"
                    end,

                    title = function()
                        project_name = get_project_name()
                        project_name = string.gsub(project_name,"\n", "")
                        if project_name == nil then
                            project_name = "NoPro"
                        end
                        return project_name  .. " Note"
                    end,
                },
            }
        })

        vim.keymap.set("n", "<leader>n", function() global_note.toggle_note() end, {
            desc = "Toggle global note",
        })
        vim.keymap.set("n", "<leader>pn", function()
            global_note.toggle_note("project_local")
        end, {
        desc = "Toggle project note",
         })

    end
}
