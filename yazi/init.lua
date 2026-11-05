require("full-border"):setup()
require("starship"):setup()
require("recycle-bin"):setup()
require("git"):setup({
    order = 1500,
})
require("projects"):setup({})
require("mdv-previewer"):setup({})


local pref_by_location = require("pref-by-location")
pref_by_location:setup({
    project_plugin_load_event = "@projects-load",
})

require("what-size"):setup({
    priority = 400,
    LEFT = " ",
    RIGHT = " ",
})


-- ~/.config/yazi/init.lua for Linux and macOS
-- %AppData%\yazi\config\init.lua for Windows

-- Using the default configuration
require("augment-command"):setup({
    prompt = false,
    default_item_group_for_prompt = "hovered",
    smart_enter = true,
    smart_paste = false,
    smart_tab_create = false,
    smart_tab_switch = false,
    confirm_on_quit = true,
    open_file_after_creation = false,
    enter_directory_after_creation = false,
    use_default_create_behaviour = false,
    enter_archives = true,
    extract_retries = 3,
    recursively_extract_archives = true,
    preserve_file_permissions = false,
    encrypt_archives = false,
    encrypt_archive_headers = false,
    reveal_created_archive = true,
    remove_archived_files = false,
    must_have_hovered_item = true,
    skip_single_subdirectory_on_enter = true,
    skip_single_subdirectory_on_leave = true,
    smooth_scrolling = false,
    scroll_delay = 0.02,
    wraparound_file_navigation = true,
    protected_directories = {},
})
