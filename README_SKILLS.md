# MySkills 使用指南

## 1. 当前仓库收录

- `long-running-agent`
  - 用途：长时间运行的 Agent 工作模式，适合跨会话增量开发、需求澄清、审批关卡、测试验证闭环。
  - 入口文件：`long-running-agent/SKILL.md`

- `vercel-cli`
  - 用途：通过 Vercel CLI 进行部署、联调、环境变量、域名、团队与项目管理。
  - 入口文件：`vercel-cli/SKILL.md`

## 2. vercel-cli 能做什么

- 项目初始化与绑定：`vercel login`、`vercel link`、`vercel link --repo`
- 拉取云端配置：`vercel pull`
- 本地开发：`vercel dev`
- 预览部署：`vercel deploy`
- 正式部署：`vercel --prod`
- 团队/项目信息检查：`vercel whoami`
- 调试与排查：日志、部署状态、环境变量等（见 `vercel-cli/references/`）

## 3. 推荐命令速查

```bash
# 安装 Vercel CLI（如果未安装）
npm i -g vercel

# 登录
vercel login

# 单项目绑定
vercel link

# Monorepo 绑定（推荐）
vercel link --repo

# 拉取环境配置
vercel pull

# 本地开发
vercel dev

# 预览部署
vercel deploy

# 生产部署
vercel --prod
```

## 4. Skills 更新到仓库流程

```bash
# 1) 从全局 skills 同步到仓库（示例：vercel-cli）
# Windows PowerShell
$src = "$env:USERPROFILE\\.agents\\skills\\vercel-cli"
$dst = "C:\\work\\MySkills\\vercel-cli"
robocopy $src $dst /E

# 2) 提交并推送
cd C:\\work\\MySkills
git add vercel-cli
git commit -m "feat(skill): sync vercel-cli"
git push
```

## 5. 最近更新

- 2026-03-03
  - 新增并同步：`vercel-cli`
  - 远端提交：`8627e31`

## 6. 备注

- 更完整的历史技能资料见：`skills使用说明.md`
- 建议每次技能更新都在提交信息中带上 `feat(skill):` 或 `chore(skill):` 前缀，便于检索和回滚。
