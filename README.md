# 🧭 tldr-lang.nvim [WIP]

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
