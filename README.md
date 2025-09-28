# Building the container

Before running the Neovim environment, you need to build the Docker image.  
From inside the `dev-container` directory (where your `Dockerfile` is located), run:

`docker build -t nvim-container .`

# Run the container

To start Neovim inside the container and work on your current project, run:

`docker run -it --rm -v "$(pwd)":/usr/app/projects -w /usr/app/projects nvim-container`

## alias in .bashrc

Because the command to start the container is too long for me I added an alias to my .bashrc file.
`alias nvimc='docker run -it --rm -v "$(pwd)":/usr/app/projects -w /usr/app/projects nvim-container`

# nvim

## Used plugins

This Neovim configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager and includes a minimal set of plugins tailored for PHP development.

## Plugins

### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
A highly extendable fuzzy finder over lists.  
- Used for quickly finding files, searching text, and navigating projects.  
- In this setup, `<leader>ff` opens the file finder.  
- Depends on [plenary.nvim](https://github.com/nvim-lua/plenary.nvim), which provides utility functions.

### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
An incremental parsing system for better syntax highlighting and code structure awareness.  
- Provides accurate syntax highlighting and indentation.  
- Configured to install and use parsers for php, lua, html, css, javascript, json, yaml, dockerfile, markdown, bash, vim.  
- Runs `:TSUpdate` to ensure parsers are always up to date.

## Keybinding

- **`<leader>ff`** → Open Telescope file finder.
