local function append_to_file(input_file, output_file, string_to_append)
    -- Open the input file asynchronously
    vim.loop.fs_open(input_file, "r", 438, function(err, input_fd)
        if err then
            print("Error opening input file: " .. err)
            return
        end

        -- Read the entire content of the input file asynchronously
        vim.loop.fs_read(input_fd, 4096, 0, function(err, content)
            if err then
                print("Error reading input file: " .. err)
                return
            end
            vim.loop.fs_close(input_fd)

            -- Append the additional string to the content
            content = (content or "") .. string_to_append

            -- Open the output file asynchronously (create or overwrite)
            vim.loop.fs_open(output_file, "w", 438, function(err, output_fd)
                if err then
                    print("Error opening output file: " .. err)
                    return
                end

                -- Write the content to the output file asynchronously
                vim.loop.fs_write(output_fd, content, 0, function(err)
                    if err then
                        print("Error writing to output file: " .. err)
                    else
                        print("Successfully wrote to the output file.")
                    end
                    vim.loop.fs_close(output_fd)
                end)
            end)
        end)
    end)
end
