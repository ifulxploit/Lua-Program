-- Fungsi untuk membagi teks menjadi kata-kata
local function split_text(text)
    local words = {}
    for word in text:gmatch("%S+") do
        table.insert(words, word)
    end
    return words
end

-- Fungsi untuk membuat tabel rantai Markov dari teks
local function create_markov_chain(text)
    local words = split_text(text)
    local chain = {}
    for i = 1, #words - 1 do
        local current_word = words[i]
        local next_word = words[i + 1]
        if not chain[current_word] then
            chain[current_word] = {}
        end
        table.insert(chain[current_word], next_word)
    end
    return chain
end

-- Fungsi untuk menghasilkan teks acak dari tabel rantai Markov
local function generate_text(chain, length)
    local current_word = "the" -- Mulai dengan kata awal tertentu
    local generated_text = current_word
    for _ = 1, length do
        local next_words = chain[current_word]
        if next_words then
            local next_word = next_words[math.random(#next_words)]
            generated_text = generated_text .. " " .. next_word
            current_word = next_word
        else
            break
        end
    end
    return generated_text
end

-- Fungsi utama untuk menjalankan generator rantai Markov
local function run_markov_chain_generator(input_file, output_length)
    local file = assert(io.open(input_file, "r"))
    local text = file:read("*all")
    file:close()

    local chain = create_markov_chain(text)
    local generated_text = generate_text(chain, output_length)

    print(generated_text)
end

-- Contoh penggunaan
local input_file = "sample_text.txt" -- Ganti dengan nama file teks input Anda
local output_length = 100 -- Panjang teks yang dihasilkan (jumlah kata)
run_markov_chain_generator(input_file, output_length)
