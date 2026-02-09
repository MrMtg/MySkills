# Claude Code Skills 使用说明

> 本仓库收录了所有 Claude Agent Skills，用于扩展 AI 代理的能力。
> 仓库地址: https://github.com/MrMtg/MySkills.git

## 目录

- [完整 Skills 列表](#完整-skills-列表)
- [按用途分类](#按用途分类)
- [安装方法](#安装方法)
- [使用指南](#使用指南)
- [Hook 自动化](#hook-自动化)

---

## 完整 Skills 列表

### 1. agent-skills

**用途**: React 和 Next.js 性能优化指南集合

**功能**:
- 包含 40+ 条性能优化规则
- 涵盖 8 大分类：瀑布流消除、打包优化、服务端性能、数据获取、重渲染优化等
- Vercel 工程团队最佳实践

**使用场景**:
- 编写 React 组件时
- 实现 Next.js 页面时
- 代码性能审查
- 优化打包大小或加载时间

---

### 2. anthropics-skills

**用途**: Anthropic 官方技能集合

**来源**: Anthropic 官方

**使用场景**: 官方提供的 AI 技能模板和最佳实践参考

---

### 3. backend-patterns

**用途**: 后端架构模式

**英文描述**: Backend architecture patterns, API design, database optimization, and server-side best practices for Node.js, Express, and Next.js API routes.

**功能**:
- Node.js、Express、Next.js API 路由的后端架构设计
- API 设计最佳实践
- 数据库优化
- 服务器端开发规范

---

### 4. bmad-skills

**用途**: BMAD 技能集合

**来源**: 第三方社区

---

### 5. claude-code-skills

**用途**: Claude Code 技能集合

**来源**: Anthropic 官方

---

### 6. clickhouse-io

**用途**: ClickHouse 数据库模式

**英文描述**: ClickHouse database patterns, query optimization, analytics, and data engineering best practices for high-performance analytical workloads.

**功能**:
- ClickHouse 数据库模式设计
- 查询优化
- 数据分析工程
- 高性能分析工作负载最佳实践

---

### 7. coding-standards

**用途**: 通用编码标准

**英文描述**: Universal coding standards, best practices, and patterns for TypeScript, JavaScript, React, and Node.js development.

**功能**:
- TypeScript、JavaScript 编码规范
- React 和 Node.js 开发最佳实践
- 通用设计模式

---

### 8. composio-skills

**用途**: Composio 技能集合

**来源**: Composio 平台

**功能**: Composio 平台相关的集成技能

---

### 9. continuous-learning

**用途**: 持续学习

**英文描述**: Automatically extract reusable patterns from Claude Code sessions and save them as learned skills for future use.

**功能**:
- 自动从对话中提取可重用模式
- 将经验保存为技能供将来使用
- 持续改进 AI 能力

---

### 10. eval-harness

**用途**: 评估框架

**英文描述**: Formal evaluation framework for Claude Code sessions implementing eval-driven development (EDD) principles

**功能**:
- 实现评估驱动开发 (EDD) 原则
- 正式评估框架
- 会话质量评估

---

### 11. everything-claude-code

**用途**: Claude Code 完整配置集合（Anthropic 黑客马拉松获奖作品）

**功能**:
- 生产级 agents（规划、架构、TDD、代码审查、安全审查等）
- 工作流 skills（编码规范、前后端模式、持续学习等）
- 斜杠命令（/tdd、/plan、/e2e、/code-review 等）
- Hooks 自动化
- 跨平台支持（Windows/macOS/Linux）

**使用场景**:
- 想要完整的 Claude Code 开发环境
- 需要测试驱动开发工作流
- 需要代码审查和安全检查

**安装**:
```bash
/plugin marketplace add affaan-m/everything-claude-code
/plugin install everything-claude-code@everything-claude-code
```

---

### 12. frontend-patterns

**用途**: 前端开发模式

**英文描述**: Frontend development patterns for React, Next.js, state management, performance optimization, and UI best practices.

**功能**:
- React、Next.js 前端开发模式
- 状态管理最佳实践
- 性能优化
- UI 开发规范

---

### 13. github-to-skills

**用途**: 自动将 GitHub 仓库转换为 AI Skills 的工厂工具

**功能**:
- 自动获取仓库元数据（描述、README、最新提交哈希）
- 生成标准化的 skill 目录结构
- 生成带扩展元数据的 SKILL.md
- 创建 wrapper 脚本接口

**使用场景**:
- 用户给 GitHub URL 想要"打包"、"封装"、"创建 skill"
- 批量转换开源工具为 skills

---

### 14. html-to-requirement-doc

**用途**: HTML 转需求文档

**中文描述**: 从HTML文件逆向生成需求文档，提取前端布局结构、API数据调用、核心数据结构、前端渲染要点

**功能**:
- 从 HTML 文件逆向生成需求文档
- 提取前端布局结构
- 识别 API 数据调用
- 提取核心数据结构
- 分析前端渲染要点

---

### 15. karanb192-skills

**用途**: Karanb192 技能集合

**来源**: GitHub 用户 karanb192

---

### 16. notebooklm-py

**用途**: Google NotebookLM 非官方 Python 客户端

**功能**:
- 使用未公开的 RPC API 自动化 NotebookLM
- 笔记本管理、源集成、AI 查询
- 工作室工件生成（播客、视频、测验等）
- CLI 工具和 Python API

**安装**:
```bash
pip install notebooklm-py
```

---

### 17. pet-app-dev

**用途**: 宠物 APP 开发指南 Skill（公司专用）

**中文描述**: 你是一个**宠物APP开发专家助手**，专注于使用 uni-app x 框架开发宠物类应用

**功能**:
- uni-app x 开发规范
- 产品决策文档（4个Tab导航、MVP功能清单）
- 商业优先原则
- uts/uvue/ucss 语法规范

**核心功能**:
- 宠物档案管理
- 宠物日历管理
- AI 预问诊
- 简易社区
- 权益资产系统

---

### 18. planning-with-files

**用途**: 像 manus AI 一样使用持久化 Markdown 文件进行规划和进度跟踪

**功能**:
- 三文件模式：task_plan.md、findings.md、progress.md
- Hooks 自动化提醒
- 会话恢复功能
- 支持多 IDE（Claude Code、Cursor、Gemini CLI 等）

**使用命令**:
- `/plan` - 开始规划
- `/planning` - 原始命令

---

### 19. postgres-patterns

**用途**: PostgreSQL 数据库模式

**英文描述**: PostgreSQL database patterns for query optimization, schema design, indexing, and security. Based on Supabase best practices.

**功能**:
- PostgreSQL 数据库模式设计
- 查询优化
- 架构设计
- 索引和安全
- 基于 Supabase 最佳实践

---

### 20. project-guidelines-example

**用途**: 项目指南示例

**英文描述**: This is an example of a project-specific skill. Use this as a template for your own projects.

**功能**: 项目特定技能的示例模板，基于真实生产应用 Zenith（AI 驱动的客户发现平台）

---

### 21. security-review

**用途**: 安全审查

**英文描述**: Use this skill when adding authentication, handling user input, working with secrets, creating API endpoints, or implementing payment/sensitive features. Provides comprehensive security checklist and patterns.

**功能**:
- 身份验证安全检查
- 用户输入验证
- 密钥处理规范
- API 端点安全
- 支付/敏感功能安全清单

---

### 22. skill-evolution-manager

**用途**: Skills 进化管理中枢

**中文描述**: 专门用于在对话结束时，根据用户反馈和对话内容总结优化并迭代现有 Skills 的核心工具

**功能**:
- 复盘诊断：在对话结束时分析 Skill 表现
- 经验提取：将用户反馈转化为结构化 JSON
- 智能缝合：将沉淀的经验写入 SKILL.md
- 跨版本对齐：Skill 更新后经验不丢失

**触发方式**:
- `/evolve`
- "复盘一下刚才的对话"
- "把这个经验保存到 Skill 里"

---

### 23. skill-manager

**用途**: GitHub-based Skills 生命周期管理器

**英文描述**: Lifecycle manager for GitHub-based skills. Use this to batch scan your skills directory, check for updates on GitHub, and perform guided upgrades of your skill wrappers.

**功能**:
- 批量扫描 skills 目录
- 检查 GitHub 更新
- 生成状态报告
- 引导升级 Skill wrappers

**触发方式**:
- `/skill-manager check` - 检查更新
- `/skill-manager list` - 列出所有 skills
- `/skill-manager delete <skill_name>` - 删除 skill

---

### 24. strategic-compact

**用途**: 策略性上下文压缩

**英文描述**: Suggests manual context compaction at logical intervals to preserve context through task phases rather than arbitrary auto-compaction.

**功能**:
- 在逻辑间隔建议手动上下文压缩
- 通过任务阶段保留上下文
- 避免任意自动压缩

---

### 25. superpowers

**用途**: 超级能力 - 完整的软件开发工作流

**英文描述**: A complete software development workflow for your coding agents, built on top of a set of composable "skills"

**功能**:
- 完整的软件开发工作流
- 强调 TDD、YAGNI、DRY 原则
- 支持子代理驱动的开发过程
- 技能自动触发

---

### 26. tdd-workflow

**用途**: 测试驱动开发工作流

**英文描述**: Use this skill when writing new features, fixing bugs, or refactoring code. Enforces test-driven development with 80%+ coverage including unit, integration, and E2E tests.

**功能**:
- 强制执行 TDD 原则
- 要求 80%+ 测试覆盖率
- 单元测试、集成测试、E2E 测试
- 测试最佳实践

---

### 27. tech-cofounder

**用途**: 技术联合创始人（新增！）

**中文描述**: 启用技术联合创始人模式。AI 扮演技术合伙人，帮你从想法到做出真实可用的产品。分阶段构建：发现→规划→构建→打磨→交付

**功能**:
- Phase 1: 发现 - 理解需求，挑战假设
- Phase 2: 规划 - 定义 v1 范围，技术方案
- Phase 3: 构建 - 分阶段开发，持续反馈
- Phase 4: 打磨 - 专业质感，错误处理
- Phase 5: 交付 - 部署，文档，后续建议

**项目文件**:
```
.claude/
├── project.md          # 项目概览、目标、状态
├── requirements.md     # 详细需求文档
├── tech-stack.md       # 技术栈选择说明
├── progress.md         # 当前进度和待办
└── decisions.md        # 关键决策记录
```

---

### 28. ui-ux-pro-max-skill

**用途**: UI/UX 设计智能工具包

**功能**:
- 50+ 种设计风格
- 97 种配色方案
- 57 种字体搭配
- 99 条 UX 指南
- 25 种图表类型
- 支持 9 种技术栈（React、Next.js、Vue、SwiftUI 等）

**使用场景**:
- 设计新的 UI 组件或页面
- 选择配色和字体
- 代码 UX 审查
- 构建落地页或仪表盘
- 实现无障碍要求

---

### 29. verification-loop

**用途**: 验证循环

**英文描述**: A comprehensive verification system for Claude Code sessions

**功能**:
- 完整的验证系统
- 在完成功能或重大代码更改后使用
- 创建 PR 之前的质量检查

---

## 按用途分类

### 开发流程管理

| Skill | 用途 |
|-------|------|
| planning-with-files | 任务规划和进度跟踪 |
| everything-claude-code | 完整开发环境配置 |
| tech-cofounder | 技术联合创始人模式 |
| verification-loop | 代码验证系统 |

### 代码质量与优化

| Skill | 用途 |
|-------|------|
| agent-skills | React/Next.js 性能优化 |
| tdd-workflow | 测试驱动开发 |
| coding-standards | 通用编码标准 |
| security-review | 安全审查 |
| frontend-patterns | 前端开发模式 |
| backend-patterns | 后端架构模式 |

### 数据库与数据

| Skill | 用途 |
|-------|------|
| postgres-patterns | PostgreSQL 最佳实践 |
| clickhouse-io | ClickHouse 数据分析 |

### Skill 管理

| Skill | 用途 |
|-------|------|
| github-to-skills | 仓库转 Skill |
| skill-manager | Skill 生命周期管理 |
| skill-evolution-manager | Skill 进化学习 |
| continuous-learning | 持续学习 |

### 领域专用

| Skill | 用途 |
|-------|------|
| pet-app-dev | 宠物 APP 开发（公司专用）|
| notebooklm-py | NotebookLM API 客户端 |
| html-to-requirement-doc | HTML 转需求文档 |
| ui-ux-pro-max-skill | UI/UX 设计指南 |

---

## 安装方法

### Claude Code 插件安装

```bash
# everything-claude-code
claude plugins install affaan-m/everything-claude-code

# planning-with-files
claude plugins install OthmanAdi/planning-with-files
```

### 手动安装

```bash
# 复制 skills 到本地配置
cp -r <skill-folder> ~/.claude/skills/

# Windows
xcopy /E /I <skill-folder> %USERPROFILE%\.claude\skills\<skill-name>
```

---

## Hook 自动化

系统配置了 hook，每当新建一个 skill 时会自动：

1. **添加备注说明** - 更新本文档，添加新 skill 的描述
2. **复制到公司文件夹** - 将 skill 复制到 `公司专用/` 目录
3. **推送到 GitHub** - 自动提交并推送到 https://github.com/MrMtg/MySkills.git

### Hook 配置位置

```bash
~/.claude/hooks/user-prompt-submit-hook.mjs
```

### Hook 触发条件

- 当 AI 检测到新建 `.claude/skills/<新技能>/SKILL.md` 时
- 自动执行备份脚本

---

## 公司专用文件夹

`公司专用/` 文件夹用于存放内部开发的 Skills：

- **pet-app-dev** - 宠物 APP 开发指南（uni-app x）
- **tech-cofounder** - 技术联合创始人模式

---

## 更新日志

| 日期 | 更新内容 |
|------|---------|
| 2025-02-02 | 初始版本，收录 9 个 Skills |
| 2026-02-09 | 完整更新，收录 29 个 Skills，新增 tech-cofounder |

---

## 统计信息

- **Skills 总数**: 29
- **公司专用**: 2 个
- **仓库地址**: https://github.com/MrMtg/MySkills.git

---

## 贡献

欢迎贡献新的 Skills！请遵循以下格式：
1. 创建独立的文件夹
2. 包含 `SKILL.md` 文件
3. 添加清晰的用途说明（name 和 description）
4. 更新本文档

---

## 许可证

各 Skill 遵循其原有的许可证（大多数为 MIT）。
