-- Function to download a file asynchronously
function download_file(url, dest_dir, filename)
  -- Ensure the destination directory exists
  vim.loop.fs_mkdir(dest_dir, 511) -- 511 = 0755 in octal

  -- Build the full destination path
  local dest_path = dest_dir .. '/' .. filename

  -- Use curl to download the file in the background
  local command = string.format('curl -sSL %s -o %s', url, dest_path)

  -- Start the asynchronous job using vim.loop.spawn
  vim.loop.spawn('sh', {
    args = { '-c', command },
    stdio = { nil, nil, nil },  -- We do not need to handle stdout, stderr
  }, function(code, signal)
    if code == 0 then
      print("File downloaded successfully to: " .. dest_path)
    else
      print("Error downloading file. Exit code: " .. code)
    end
  end)
end

download_file('https://github.com/stunnel/static-curl/releases/download/8.11.1/curl-linux-x86_64-musl-8.11.1.tar.xz', vim.fn.stdpath('config') .. "/downloads", 'curl.tar.xz')
