# MShell

> **MShell** 代表 **模块化 Shell (Modularized Shell)**。它帮助您编写大型但易于维护的 Shell 脚本。

![MShell 架构](https://raw.githubusercontent.com/maoshuai/mshell/main/doc/img/header.png)

MShell 是一个框架，旨在为 Shell 脚本带来模块化、结构化和企业级特性。它将传统的线性 Shell 脚本转变为具有适当错误处理、日志记录和模块系统的组织化、可维护的应用程序。

## 🏗️ 架构概览

MShell 遵循清晰的分层架构：

- **启动器 (Launcher)**: 初始化环境的入口点
- **模块系统 (Module System)**: 使用 `importModule` 语法的可重用组件
- **作业调度器 (Job Scheduler)**: 管理执行生命周期，包含日志记录和监控
- **处理器 (Handlers)**: 遵循处理器模式的业务逻辑容器
- **配置管理 (Configuration)**: 基于配置文件的环境管理

## 🚀 快速开始

### 安装

**MacOS & Linux:**
```bash
git clone https://github.com/maoshuai/mshell.git
echo 'MSHELL_PROFILE=dev' > ~/.mshellrc
```

### 基本使用

```bash
# 运行简单处理器
./shell/launcher.sh sample/4_use_module.sh "hello world"

# 运行任意 Shell 脚本（向后兼容）
./shell/launcher.sh sample/1_native_shell.sh
```

## 📚 核心概念

### 模块系统
在脚本中任何位置导入可重用模块：
```bash
importModule 'log'
importModule 'util'

handler_main(){
    logInfo "处理参数: $@"
    util_assertArgumentNotEmpty "$1" "第一个参数"
}
```

### 处理器模式
所有业务逻辑都应作为 `shell/handler/` 目录下的处理器实现：
- 定义 `handler_main()` 函数作为入口点
- 按需导入模块
- 返回适当的退出码以控制作业状态

### 作业生命周期
每个处理器执行都被视为一个作业，具有完整的生命周期管理：
1. **初始化**: 设置日志、生成作业ID、获取锁
2. **执行**: 运行您的 `handler_main()` 函数
3. **监控**: 跟踪执行时间、参数和系统信息
4. **清理**: 释放资源并输出执行摘要

## 🔧 内置模块

MShell 提供多个内置模块：

- **`log`**: 结构化日志记录，支持多级别（info, warn, error, echo）
- **`util`**: 工具函数（`util_assertArgumentNotEmpty`, `util_isFileEmpty`）
- **`job`**: 作业调度和生命周期管理
- **`profile`**: 配置文件管理
- **`lock`**: 基于文件的锁定，确保并发执行安全
- **`git`**: Git 仓库信息集成
- **`cache`**: 简单的缓存机制

## 🎯 适用场景

- **复杂自动化脚本**: 当您的 Shell 脚本超出简单序列时
- **DevOps 工具**: 可靠、有日志记录和监控的运维脚本
- **CI/CD 流水线**: 结构化的构建和部署脚本
- **系统管理**: 可维护和可调试的管理脚本

## 🛠️ 开发

### 构建
```bash
mvn clean package
```

### 创建自定义处理器
1. 在 `shell/handler/` 目录下创建新文件
2. 使用 `importModule` 导入所需模块
3. 实现您的 `handler_main()` 函数
4. 通过 `./shell/launcher.sh your_handler_name` 执行

### 扩展模块
1. 在 `shell/module/` 目录下创建 `.module` 文件
2. 定义函数和变量
3. 在处理器中使用 `importModule 'your_module_name'` 导入

## 📜 许可证

根据 Apache License 2.0 分发。详见 [LICENSE](LICENSE) 获取更多信息。

## 👥 贡献

1. Fork 项目 (<https://github.com/maoshuai/mshell/fork>)
2. 创建功能分支 (`git checkout -b feature/fooBar`)
3. 提交更改 (`git commit -am 'Add some fooBar'`)
4. 推送到分支 (`git push origin feature/fooBar`)
5. 创建 Pull Request

## 📞 联系方式

**Maoshuai** – [GitHub](https://github.com/maoshuai) – imshuai67@gmail.com

---

*使用 MShell 的模块化方法编写更好的 Shell 脚本！*