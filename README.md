# :running_man: tldr-lang.nvim [WIP]

![tldr-lang screenshot](https://user-images.githubusercontent.com/226654/216842102-c13c7cfb-aeba-4c84-9825-605c953e173e.gif)

A NeoVIM plugin to give tldr-style docs for various language features.

## Installation

### Lazy

```
{
    "roobert/tldr-lang.nvim",
    dependencies = "roobert/node-type.nvim",
    config = function()
        require("tldr-lang").setup()
    end,
},
```

### Packer

```
use({
    "roobert/tldr-lang.nvim",
    dependencies = "roobert/node-type.nvim",
    config = function()
        require("tldr-lang").setup()
    end,
})
```
