#!/bin/bash
# GitHub 推送命令
# 请将 YOUR_USERNAME 替换为你的 GitHub 用户名
# 将 YOUR_TOKEN 替换为你的 Personal Access Token

cd /c/work/MySkills

# 配置 git 用户信息
git config user.name "MrMtg"
git config user.email "your-email@example.com"

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Add all skills and documentation"

# 添加远程仓库（替换 YOUR_USERNAME）
git remote add origin https://YOUR_TOKEN@github.com/YOUR_USERNAME/MySkills.git

# 推送
git push -u origin main

# 如果遇到错误，尝试强制推送
# git push -u origin main --force
