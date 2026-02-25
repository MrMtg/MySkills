# Free MCP Browser Tools (GitHub)

以下工具均可免费使用（开源、本地运行）。

## 1) Playwright MCP (首选)

- Repo: https://github.com/microsoft/playwright-mcp
- 特点：稳定、维护活跃、适合自动化交互回归。
- 安装（常见）：
  - `npm install -g @playwright/mcp@latest`
  - 或通过 `npx @playwright/mcp@latest`

适用场景：
- 登录/表单/多步流程自动化
- 页面可视行为验证
- 截图和回归测试

## 2) Chrome DevTools MCP

- Repo: https://github.com/ChromeDevTools/chrome-devtools-mcp
- 特点：深度调试能力强，适合性能/网络/控制台问题定位。
- 安装（常见）：
  - `npm install -g chrome-devtools-mcp@latest`
  - 或 `npx chrome-devtools-mcp@latest`

适用场景：
- 前端性能瓶颈定位
- 网络请求与控制台错误排查
- 手工调试辅助

## 3) MCP Puppeteer Server (备用)

- Repo: https://github.com/modelcontextprotocol/servers
- Package: https://www.npmjs.com/package/@modelcontextprotocol/server-puppeteer
- 特点：轻量，适合作为 Playwright 备选。

适用场景：
- 简单交互和页面抓取
- 作为降级方案

## Recommended Selection Rule

1. 默认：Playwright MCP
2. 需要深入 DevTools：Chrome DevTools MCP
3. 轻量备用：Puppeteer Server

## Setup Checklist

1. 安装 Node.js 18+
2. 安装所选 MCP 工具
3. 在 Agent/MCP 配置中注册该服务器
4. 运行一次最小浏览器用例（打开页面+点击+断言+截图）
5. 将用例命令写入 `testing.md`

## Notes

- 这些工具本身免费，但目标站点如依赖外部付费服务，费用由目标系统决定。
- 若环境无法启动浏览器，立即触发阻塞求助流程。
