lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"node_modules/", "__pycache__/", "*.pyc"},
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_cat.new
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true
    }
  }
}

require('telescope').load_extension('fzy_native')
EOF
