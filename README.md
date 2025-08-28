# Dao3up.nvim
适用于 [dao3up](https://github.com/tobylai-toby/dao3up) 的 `Neovim` 插件

可以实现一些原本在 `Vscode` + `ArenaPro Creator` 上的编辑功能
## 安装
lazy.nvim配置
```lua
return {
    "tobylai-toby/dao3up.nvim",
    opts={
        height=6,
    },
    config = function(_, opts)
        require('dao3up').setup(opts)
    end
}

```

## 使用
### 内置命令
- `:UpLogin` 登陆 [dao3](https://dao3.fun) 账号
- `:UpNew` 创建 `ArenaPro` 项目并且配置 `dao3up`
- `:UpLink` 链接扩展地图
- `:UpBuild` 运行构建并上传
- `:UpWatch` 热模块更新(HMR)模式，自动监听修改并构建、上传
### 配置
- `height` 配置终端行高，默认为 `6`
- `npx_command` 配置执行 `npx` 的命令，默认为 `"npx -y --registry=https://mirrors.cloud.tencent.com/npm/ "`