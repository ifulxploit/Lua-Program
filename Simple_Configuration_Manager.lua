local pl_config = require("pl.config")

local config_file = "config.ini"

-- Function to read configuration from file
local function read_config()
    local config = pl_config.read(config_file)
    return config
end

-- Function to write configuration to file
local function write_config(config)
    pl_config.write(config, config_file)
end

-- Function to set configuration value
local function set_config_value(key, value)
    local config = read_config()
    config[key] = value
    write_config(config)
    print("Configuration value '"..key.."' set to '"..value.."'")
end

-- Function to get configuration value
local function get_config_value(key)
    local config = read_config()
    local value = config[key]
    if value then
        print("Value of '"..key.."' is '"..value.."'")
    else
        print("Configuration value '"..key.."' not found")
    end
end

-- Example usage
set_config_value("server_address", "127.0.0.1")
get_config_value("server_address")
