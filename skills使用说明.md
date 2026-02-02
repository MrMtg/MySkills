# Skills 使用说明

> 本仓库收录了所有 Claude Agent Skills，用于扩展 AI 代理的能力。

## 目录

- [Skills 列表](#skills-列表)
- [按用途分类](#按用途分类)
- [安装方法](#安装方法)
- [使用指南](#使用指南)

---

## Skills 列表

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

**安装**:
```bash
npx add-skill vercel-labs/agent-skills
```

---

### 2. everything-claude-code

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
- 需要 Token 优化和内存持久化

**安装**:
```bash
/plugin marketplace add affaan-m/everything-claude-code
/plugin install everything-claude-code@everything-claude-code
```

---

### 3. github-to-skills

**用途**: 自动将 GitHub 仓库转换为 AI Skills 的工厂工具

**功能**:
- 自动获取仓库元数据（描述、README、最新提交哈希）
- 生成标准化的 skill 目录结构
- 生成带扩展元数据的 SKILL.md（用于生命周期管理）
- 创建 wrapper 脚本接口

**使用场景**:
- 用户给 GitHub URL 想要"打包"、"封装"、"创建 skill"
- 批量转换开源工具为 skills

**触发方式**:
- `/github-to-skills <github_url>`
- "Package this repo into a skill: <url>"

---

### 4. notebooklm-py

**用途**: Google NotebookLM 非官方 Python 客户端

**功能**:
- 使用未公开的 RPC API 自动化 NotebookLM
- 笔记本管理、源集成、AI 查询、工作室工件生成（播客、视频、测验等）
- CLI 工具和 Python API

**使用场景**:
- 需要 NotebookLM 的程序化访问
- 批量处理笔记和文档
- 自动生成音频/视频摘要

**安装**:
```bash
pip install notebooklm-py
```

---

### 5. pet-app-dev

**用途**: 宠物 APP 开发指南 Skill（公司专用）

**功能**:
- uni-app x 开发规范
- 产品决策文档（4个Tab导航、MVP功能清单）
- 商业优先原则
- uts/uvue/ucss 语法规范

**使用场景**:
- 开发宠物类 APP
- 使用 uni-app x 框架开发
- 需要遵循产品决策文档要求

**核心功能**:
- 宠物档案管理
- 宠物日历管理
- AI 预问诊
- 简易社区
- 权益资产系统

---

### 6. planning-with-files

**用途**: 像 Manus AI 一样使用持久化 Markdown 文件进行规划和进度跟踪

**功能**:
- 三文件模式：task_plan.md、findings.md、progress.md
- Hooks 自动化提醒
- 会话恢复功能
- 支持多 IDE（Claude Code、Cursor、Gemini CLI 等）

**使用场景**:
- 多步骤复杂任务
- 研究任务
- 构建项目
- 跨多次会话的长期任务

**安装**:
```bash
claude plugins install OthmanAdi/planning-with-files
```

**使用命令**:
- `/plan` - 开始规划
- `/planning` - 原始命令

---

### 7. skill-evolution-manager

**用途**: Skills 进化管理中枢

**功能**:
- 复盘诊断：在对话结束时分析 Skill 表现
- 经验提取：将用户反馈转化为结构化 JSON
- 智能缝合：将沉淀的经验写入 SKILL.md
- 跨版本对齐：Skill 更新后经验不丢失

**使用场景**:
- 需要从对话中学习并优化 Skills
- 希望持续改进 AI 工具的表现
- 需要保存用户偏好和修复经验

**触发方式**:
- `/evolve`
- "复盘一下刚才的对话"
- "把这个经验保存到 Skill 里"

---

### 8. skill-manager

**用途**: GitHub-based Skills 生命周期管理器

**功能**:
- 批量扫描 skills 目录
- 检查 GitHub 更新
- 生成状态报告
- 引导升级 Skill wrappers

**使用场景**:
- 管理大量从 GitHub 创建的 skills
- 检查哪些 skills 需要更新
- 批量升级 skills

**触发方式**:
- `/skill-manager check` - 检查更新
- `/skill-manager list` - 列出所有 skills
- `/skill-manager delete <skill_name>` - 删除 skill

---

### 9. ui-ux-pro-max-skill

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

**搜索命令**:
```bash
python3 skills/ui-ux-pro-max/scripts/search.py "<query>" --design-system -p "Project Name"
```

---

## 按用途分类

### 开发流程管理

| Skill | 用途 |
|-------|------|
| planning-with-files | 任务规划和进度跟踪 |
| everything-claude-code | 完整开发环境配置 |

### 代码优化

| Skill | 用途 |
|-------|------|
| agent-skills | React/Next.js 性能优化 |
| ui-ux-pro-max-skill | UI/UX 设计指南 |

### Skill 管理

| Skill | 用途 |
|-------|------|
| github-to-skills | 仓库转 Skill |
| skill-manager | Skill 生命周期管理 |
| skill-evolution-manager | Skill 进化学习 |

### 领域专用

| Skill | 用途 |
|-------|------|
| pet-app-dev | 宠物 APP 开发（公司专用） |
| notebooklm-py | NotebookLM API 客户端 |

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

# 复制 commands
cp <command-folder>/*.md ~/.claude/commands/

# 复制 agents
cp <agent-folder>/*.md ~/.claude/agents/
```

---

## 使用指南

### Skills 自动触发

大多数 Skills 会在相关任务触发时自动激活，无需手动调用。

### 手动调用

使用斜杠命令手动调用特定 Skill：

```
/plan              # 开始规划
/tdd               # 测试驱动开发
/code-review       # 代码审查
/learn             # 提取模式
```

### Skill 配置

每个 Skill 可以通过修改其 `SKILL.md` 文件进行自定义配置。

---

## 公司专用文件夹

`公司专用/` 文件夹用于存放内部开发的 Skills，如：
- pet-app-dev：宠物 APP 开发指南

---

## 更新日志

| 日期 | 更新内容 |
|------|---------|
| 2025-02-02 | 初始版本，收录 9 个 Skills |

---

## 贡献

欢迎贡献新的 Skills！请遵循以下格式：
1. 创建独立的文件夹
2. 包含 `SKILL.md` 或 `README.md`
3. 添加清晰的用途说明

---

## 许可证

各 Skill 遵循其原有的许可证（大多数为 MIT）。
