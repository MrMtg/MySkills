#!/bin/bash
# GitHub 自动推送脚本 - MySkills 仓库
# 功能：自动添加新 skills、更新文档、推送到 GitHub

set -e  # 遇到错误立即退出

# 配置
REPO_DIR="/c/work/MySkills"
SKILLS_SOURCE="/c/Users/22267/.claude/skills"
COMPANY_DIR="$REPO_DIR/公司专用/skills"
README="$REPO_DIR/skills使用说明.md"

cd "$REPO_DIR"

echo "=========================================="
echo "MySkills 自动备份脚本"
echo "=========================================="
echo ""

# 1. 确保 git 配置正确
git config user.name "MrMtg" || true
git config user.email "mrmtg@users.noreply.github.com" || true

# 2. 复制所有 skills 到公司专用文件夹
echo "📁 复制 skills 到公司专用文件夹..."
mkdir -p "$COMPANY_DIR"
cp -r "$SKILLS_SOURCE"/* "$COMPANY_DIR/" 2>/dev/null || true

# 清理嵌套的 .git 目录
find "$COMPANY_DIR" -name ".git" -type d -exec rm -rf {} + 2>/dev/null || true

echo "✅ 已复制 skills"

# 3. 显示当前状态
echo ""
echo "📊 当前状态:"
git status --short

# 4. 添加所有更改
echo ""
echo "➕ 添加文件到 git..."
git add -A

# 5. 检查是否有更改
if git diff --cached --quiet; then
    echo "ℹ️  没有新的更改，无需提交"
    exit 0
fi

# 6. 提交
TIMESTAMP=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)
COMMIT_MSG="自动备份 skills - $TIMESTAMP $TIME

- 更新 skills 文档
- 同步最新 skills 到仓库
- Skills 总数: $(ls -1 "$SKILLS_SOURCE" | wc -l)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"

echo ""
echo "💾 提交更改..."
git commit -m "$COMMIT_MSG"

# 7. 推送
echo ""
echo "🚀 推送到 GitHub..."
git push origin main

echo ""
echo "=========================================="
echo "✅ 备份完成！"
echo "=========================================="
echo ""
echo "📊 统计信息:"
echo "  - Skills 总数: $(ls -1 "$SKILLS_SOURCE" | wc -l)"
echo "  - 仓库地址: https://github.com/MrMtg/MySkills"
echo ""
