# CodeCraft - The Best Code Editor.

CodeCraft is an AI-powered code editor designed to enhance your coding experience. Whether you’re a seasoned developer or just starting out, CodeCraft provides a powerful environment for writing, editing, and testing your code seamlessly. With features like intelligent code suggestions, syntax highlighting, and real-time error checking, CodeCraft aims to boost your productivity and streamline your development workflow.

</details>

## Install

<details>
  <summary><strong>Prerequisites</strong> <small><i>(🔎 Click to expand/collapse)</i></small></summary>

### Prerequisites

- [Neovim] >= v0.8.0
- [git]
- [make]
- [pip]
- [python] 
- [npm]
- [node]
- [cargo]
- [ripgrep]

</details>

```shell
bash <(curl -s "https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh")
mv ~/.config/lvim ~/.config/lvim_backup
git clone https://github.com/Linux-DADDY/CodeCraft.git ~/.config/lvim
lvim +LvimUpdate +LvimCacheReset +q
lvim # run :Lazy sync
```
