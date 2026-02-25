---
name: long-running-agent
description: 长时间运行的 Agent 工作模式。用于旧工程和新工程的跨会话增量开发，强制多轮需求澄清、用户审批关卡、代码测试+浏览器实测、阻塞主动求助。
version: 2.0.0
author: User + Codex
tags: [agent, workflow, spec-driven, browser-testing, approval-gate]
---

# Long Running Agent Work Mode

## Purpose

将长周期开发固化为可重复执行的工作模式：
- 先澄清需求，再计划，再执行
- 用户是最终裁定官
- 用户未介入时，按约束文件自动验收
- 每个任务必须完成代码测试和浏览器实测
- 遇到阻塞必须主动求助，不允许闷头硬做

## When To Use

在以下场景触发本技能：
- 需要连续多轮会话推进同一项目
- 需要对旧工程做增量开发和稳定迭代
- 需要明确审批关卡和可追踪验收证据
- 需要把浏览器实测纳入强制流程

## Core Artifacts

在项目根目录建立并维护以下文件：
- `app_spec.md`：需求说明（可来自对话或外部文档）
- `rules.md`：编码/架构/安全规则
- `testing.md`：测试策略与通过标准
- `scope.md`：范围边界（做什么/不做什么）
- `target.md`：目标产物定义
- `task.json`：任务清单与 `passes` 状态（唯一标准命名）
- `progress.txt`：会话级进度记录（唯一标准命名）
- `init.sh`：环境启动脚本
- `git`：必须存在；用于短平快提交与可回滚历史

## Non-Negotiable Rules

1. 先澄清后计划：未达到高置信理解前，不输出执行计划。
2. 多轮对话：每轮只处理关键澄清点，持续复述理解并确认。
3. 先审批后执行：约束文件与任务清单必须先经用户确认。
4. 一次一个任务：每轮仅推进一个 `passes: false` 项，禁止并行推进多个任务。
5. 必做双重验证：代码测试 + 浏览器实测缺一不可。
6. 用户缺席自动验收：若用户未主动介入，严格按约束文件判定通过与否。
7. 阻塞立即求助：遇到权限、环境、需求冲突、测试不可达，立即向用户提问并等待裁定。
8. 初始化前必须有 Git：无仓库则先初始化并确认分支策略，再开始任务。
9. 严格短提交：一条任务一个 commit；单组件问题保持单 commit；禁止“多任务打包提交”。
10. 会话干净收尾：每轮结束必须可运行、可验证、可回滚，不留“半成品脏状态”。
11. 单实例服务：测试期间只允许一个常驻 dev/preview 实例，不得重复启动多个端口。
12. 先复用后重启：每轮测试先检查并复用现有服务；确需重启时，必须先关闭旧进程再启动新进程。

## Workflow

### Phase 1: Requirement Intake

1. 收集需求来源（对话、外部文档、历史需求）。
2. 输出“理解清单”：目标、边界、验收标准、风险。
3. 与用户进行多轮澄清，直到用户确认“可进入计划”。

### Phase 2: Constraint Freeze

1. 生成或更新 `rules.md/testing.md/scope.md/target.md`。
2. 请求用户确认这些约束文件。
3. 未确认时，禁止进入任务执行。

### Phase 3: Task Freeze

1. 基于约束生成 `task.json` 草案。
2. 每项包含：描述、依赖、验收点、测试步骤、优先级。
3. 请求用户确认并冻结任务基线。
4. 复杂项目按“页面分治”：每个页面独立任务清单，先做页面内任务，再统一做跨页跳转/交互。

### Phase 4: Execution Loop

1. 读取状态：`git log`、`task.json`、`progress.txt`。
2. 启动环境：执行 `init.sh`。
3. 先回归验证已通过项关键路径。
4. 选择一个未通过任务实现。
5. 运行代码测试（按 `testing.md`）。
6. 运行浏览器实测（真实页面交互验证）。
7. 更新任务状态（仅更新 `passes`，写入 `task.json`）。
8. 更新 `progress.txt`。
9. 提交代码并记录证据（一个任务一个 commit，原子提交）。

### Phase 4b: Commit Discipline (From Anthropic Harness Principles)

1. 增量提交：每次只提交最小可验证改动，不攒大包。
2. 先验证再提交：构建与有头浏览器测试通过后再 commit。
3. 提交信息可追踪：包含页面/组件/任务号。
4. 回滚优先级：出现问题优先 `git revert` 单个问题 commit，而不是大范围回退。
5. 进度联动：每个 commit 在 `progress.txt` 写入任务号、验证结果、commit hash。

### Phase 4c: Runtime Instance Discipline

1. 固定测试端口：优先使用统一端口进行浏览器测试。
2. 端口冲突治理：检测到端口占用时，先识别并复用合法实例；仅在异常时清理并重启。
3. 进程清理约束：禁止“每次测试都新开一个服务”；测试结束后仅保留一个用户指定常驻实例。

### Phase 5: Acceptance Gate

1. 用户主动介入：以用户裁定为准。
2. 用户未介入：按约束文件自动验收。
3. 验收失败：回到当前任务继续修复，不切换任务。

## Browser Testing Policy

优先使用免费开源 MCP 浏览器工具。先读 `references/mcp-browser-tools.md` 完成选择与安装。
默认优先级：
1. `microsoft/playwright-mcp`（首选）
2. `chrome-devtools-mcp`（调试场景）
3. `@modelcontextprotocol/server-puppeteer`（备用）

## Blocking Escalation Template

遇到阻塞时，使用以下格式向用户求助：

```markdown
🚫 阻塞需要裁定
- 当前任务：<id/title>
- 阻塞原因：<具体原因>
- 已尝试：<最多3条>
- 需要你决定：
  1) 选项A（推荐）
  2) 选项B
  3) 选项C
```

## Iteration Protocol

每次会话结束都执行：
1. 记录本轮经验到 `claude-progress.txt`。
2. 识别可复用模式并更新本技能（规则、检查项、脚本）。
3. 标记“下轮优先改进点”。

## References

- `references/workflow-contract.md`
- `references/mcp-browser-tools.md`
