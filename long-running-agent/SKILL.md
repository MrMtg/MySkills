---
name: long-running-agent
description: 长时间运行的 Agent 系统框架 - 基于 Anthropic 和 SamuelQZQ 实战验证的双 Agent 架构，支持跨会话状态持久化、任务自动化循环开发
version: 1.0.0
author: Claude & SamuelQZQ
tags: [agent, workflow, automation, long-running, project-management]
---

# Long Running Agent System

一个完整的长时间运行 Agent 系统框架，用于跨多个会话完成复杂项目的开发。

## 核心特性

- **双 Agent 模式**：初始化 Agent（第一会话）+ 编码 Agent（后续会话）
- **状态持久化**：通过 Git + task.json + progress.txt 跨会话恢复状态
- **单一真理来源**：task.json 定义所有工作，只能修改 `passes` 字段
- **强制阻塞机制**：Agent 遇到无法解决的问题必须停止并求助
- **自动化循环**：run-claude-loop.sh 脚本自动运行多次开发会话

## 使用场景

当你需要：
- 开发一个中大型项目（需要 10+ 个任务）
- 跨多个会话保持开发状态
- 让 Agent 自动完成一系列任务
- 确保每个任务都有完整的测试和提交

## 快速开始

### 方式一：使用自动化脚本（推荐）

```bash
# 1. 初始化项目（通过对话收集需求）
# 对 Agent 说："帮我初始化一个新项目"

# 2. 确认生成的文件后，运行自动化脚本
chmod +x run-claude-loop.sh
./run-claude-loop.sh 999  # 运行直到所有任务完成
```

### 方式二：手动逐个任务执行

```bash
# 每个会话执行一次
./init.sh              # 初始化环境
# Agent 自动选择任务 → 实现 → 测试 → 提交
# 重复直到所有任务完成
```

## 核心文件

| 文件 | 作用 |
|------|------|
| `CLAUDE.md` | Agent 工作流程约束（最重要） |
| `task.json` | 任务列表（单一真理来源） |
| `progress.txt` | 进度日志 |
| `init.sh` | 每次会话前运行的初始化脚本 |
| `run-claude-loop.sh` | 自动化循环脚本 |
| `PRD.md` | 产品需求文档 |
| `architecture.md` | 架构设计文档 |
| `rules.md` | 编码规范 |
| `testing.md` | 测试规则 |

## 工作流程

```
┌─────────────────────────────────────────────────────────────────────────┐
│                      阶段一：初始化对话                                   │
│  收集项目信息 → 确认理解 → 生成约束文件                                   │
└─────────────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                      阶段二：环境初始化（每会话）                          │
│  ./init.sh → 安装依赖 → 启动服务器                                       │
└─────────────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                      阶段三：自动开发循环                                 │
│  选任务 → 实现 → 测试 → 更新进度 → 更新task.json → Git提交                │
└─────────────────────────────────────────────────────────────────────────┘
```

## 自动化脚本功能

`run-claude-loop.sh` 提供：

- ✅ 自动检测剩余任务数量
- ✅ 显示每次会话的进度
- ✅ 自动记录日志（claude-loop.log + claude-session-*.log）
- ✅ 所有任务完成后自动停止
- ✅ `--permission-mode acceptEdits` 自动接受权限
- ✅ 固定初始 prompt 确保流程一致

## task.json 格式

```json
{
  "project": "项目名称",
  "description": "项目简短描述",
  "tasks": [
    {
      "id": 1,
      "title": "任务标题",
      "description": "详细描述",
      "steps": ["步骤1", "步骤2"],
      "passes": false,        // ← 只能改这个字段
      "priority": "critical|high|medium|low",
      "dependencies": []      // 依赖的任务ID
    }
  ]
}
```

## 核心规则

1. **每会话一个任务** - 专注于完成一个任务
2. **测试后再标记完成** - 所有步骤必须通过
3. **分层测试** - 大幅修改用浏览器测试，小修改用 lint+build
4. **遵守编码规范** - 严格按照 rules.md 执行
5. **在 progress.txt 中记录** - 帮助未来的 Agent 理解工作
6. **一个任务一个 commit** - 代码+progress.txt+task.json 一起提交
7. **永远不要移除任务** - 只能将 `passes: false` 改为 `true`
8. **阻塞时停止** - 需要人工介入时，输出阻塞信息并停止

## 阻塞处理

当 Agent 遇到以下情况必须停止并求助：
- 缺少环境配置（API密钥、数据库等）
- 外部服务不可用
- 测试无法进行
- 需求不明确

## 完整文档

完整文档请参考：
- https://github.com/MrMtg/Auto_agents

## 模板文件

系统包含以下模板文件，用于生成新项目的约束文件：
- `templates/CLAUDE.template.md` - Agent 工作流程模板
- `templates/init-dialog.md` - 初始化对话流程模板
- `templates/rules.template.md` - 编码规范模板
- `templates/testing.template.md` - 测试规则模板
- `templates/task.template.json` - 任务列表模板
- `templates/init.template.sh` - 初始化脚本模板
- `templates/env.example` - 环境变量模板

## 示例

查看 SamuelQZQ 的示例项目：
- https://github.com/SamuelQZQ/auto-coding-agent-demo
