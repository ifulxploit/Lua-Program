local av = require("av")

-- Membuka file video
local video = av.open("input_video.mp4")

-- Membuat encoder untuk menyimpan video yang telah dimanipulasi
local encoder = av.open("output_video.mp4", "w")

-- Mendapatkan stream video dari file input
local stream = video:stream(1)

-- Menyalin metadata dari stream input ke stream output
encoder:add_stream(stream:codec())

-- Membuka encoder untuk menulis ke file output
encoder:write_header()

-- Looping setiap frame dari video input
for packet in video:demux() do
    -- Mendekodekan frame video
    local frame = packet:decode()

    -- Menambahkan filter atau manipulasi yang diinginkan di sini
    -- Contoh: Mengubah warna menjadi grayscale
    frame = frame:to_gray()

    -- Menulis frame yang telah dimanipulasi ke video output
    encoder:write_frame(frame)
end

-- Menutup file output
encoder:write_trailer()
