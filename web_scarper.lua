-- Import modul pl.url untuk memanipulasi URL
local url = require "pl.url"
-- Import modul pl.http untuk mengirim permintaan HTTP
local http = require "pl.http"

-- Fungsi untuk mengambil data dari halaman web tertentu
local function webScraper(targetUrl)
    -- Parse URL target
    local parsedUrl = url.parse(targetUrl)
    
    -- Kirim permintaan GET ke URL target dan simpan respons
    local response, err = http.request(targetUrl)
    
    -- Periksa apakah permintaan berhasil
    if response then
        -- Cetak respons
        print("Data dari halaman web:")
        print(response)
    else
        -- Cetak pesan kesalahan jika permintaan gagal
        print("Gagal mengambil data dari halaman web: " .. err)
    end
end

-- URL target untuk scraping
local targetUrl = "https://www.contohwebsite.com"

-- Panggil fungsi webScraper dengan URL target
webScraper(targetUrl)
