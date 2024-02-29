-- Fungsi untuk menampilkan pesan pengingat
local function showReminder(reminder)
    print("Pengingat:", reminder)
end

-- Fungsi untuk menambahkan tindakan kesehatan ke daftar pengingat
local function addReminder(reminders, reminder, interval)
    table.insert(reminders, {reminder = reminder, interval = interval, nextReminder = os.time() + interval})
end

-- Fungsi untuk memeriksa dan menampilkan pengingat yang sudah waktunya
local function checkReminders(reminders)
    local currentTime = os.time()
    for _, reminderData in ipairs(reminders) do
        if currentTime >= reminderData.nextReminder then
            showReminder(reminderData.reminder)
            reminderData.nextReminder = currentTime + reminderData.interval
        end
    end
end

-- Fungsi untuk menjalankan program pengingat
local function runHealthReminder()
    local reminders = {}
    
    -- Menambahkan tindakan kesehatan ke daftar pengingat
    addReminder(reminders, "Minum air", 60) -- Pengingat setiap 60 detik
    addReminder(reminders, "Bergerak", 1800) -- Pengingat setiap 1800 detik (30 menit)
    
    -- Loop utama untuk memeriksa pengingat setiap detik
    while true do
        checkReminders(reminders)
        os.execute("sleep 1") -- Menunggu 1 detik sebelum memeriksa pengingat lagi
    end
end

-- Jalankan program pengingat
runHealthReminder()
