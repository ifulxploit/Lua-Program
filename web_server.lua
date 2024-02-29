local socket = require("socket")

-- Fungsi untuk membaca isi file
local function read_file(filename)
    local file = io.open(filename, "rb")
    if file then
        local content = file:read("*all")
        file:close()
        return content
    end
    return nil
end

-- Fungsi untuk mengirim respon HTTP
local function send_response(client, status_code, content_type, body)
    local response = string.format("HTTP/1.1 %s\r\nContent-Type: %s\r\nContent-Length: %d\r\nConnection: close\r\n\r\n%s", status_code, content_type, #body, body)
    client:send(response)
    client:close()
end

-- Fungsi utama untuk menjalankan server web
local function run_web_server(port, directory)
    local server = assert(socket.bind("*", port))
    print("Server web berjalan di http://localhost:" .. port)

    while true do
        local client = server:accept()
        client:settimeout(5) -- Timeout untuk mencegah koneksi terjebak

        local request_line = client:receive()
        if request_line then
            local method, path = request_line:match("(%S+)%s+(%S+)%s+HTTP/%d%.%d")
            if method == "GET" then
                local filename = directory .. path
                local content_type = "text/plain"
                local status_code = "200 OK"
                local body = read_file(filename)

                if body then
                    if filename:match("%.html$") then
                        content_type = "text/html"
                    elseif filename:match("%.css$") then
                        content_type = "text/css"
                    elseif filename:match("%.js$") then
                        content_type = "application/javascript"
                    end
                else
                    status_code = "404 Not Found"
                    body = "File not found"
                end

                send_response(client, status_code, content_type, body)
            end
        end
    end
end

-- Contoh penggunaan
local port = 8080
local directory = "static_files/"
run_web_server(port, directory)
