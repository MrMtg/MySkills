# 宠物AI识别类页面开发规范

> **版本**: v1.0.0
> **更新日期**: 2026-02-09
> **适用项目**: 宠物排泄物、呕吐物、皮肤、眼耳口等AI健康识别页面

---

## 目录

1. [通用配置](#一通用配置)
2. [徽章系统](#二徽章系统)
3. [开发流程](#三开发流程)
4. [API接口](#四api接口)
5. [问题记录](#五问题记录)

---

## 一、通用配置

### 1.1 API服务器分类

| 服务器 | 用途 | 地址 |
|--------|------|------|
| AI服务 | 识别流程、报告生成 | `http://192.168.2.148:19000` |
| 徽章系统 | 宠豆、权益（通用） | `http://192.168.2.147:19000` |

> **注意**: 生产环境只有一个服务器，测试环境需要两个。测试通过后会切换。

### 1.2 测试环境固定配置

```javascript
// 用户信息（写死）
USER_ID = '16'

// 宠物档案（写死）
PET_PROFILE_ID = 23
```

### 1.3 每个页面需要配置

| 配置项 | 说明 | 示例 |
|--------|------|------|
| SUB_MODULE_TYPE | 子模块类型 | 4=排泄物, 12=呕吐物, 7=皮肤 |
| PET_PROFILE_ID | 宠物档案ID | 23 |
| CURRENT_EQUITY_TYPE | 对应的权益类型 | 11=排泄物检测 |

---

## 二、徽章系统

### 2.1 功能说明

徽章系统用于在导航栏显示**宠豆余额**和**权益次数**，几乎每个页面都需要。

### 2.2 组成部分

```
徽章系统
├── HTML结构：导航栏图标+徽章元素
├── CSS样式：.nav-badge 系列样式
└── JavaScript：
    ├── Token管理（定时刷新）
    ├── 宠豆余额获取
    ├── 权益次数获取
    └── 弹窗控制
```

### 2.3 HTML结构

```html
<div class="navbar">
    <div class="nav-back" onclick="navigateBack()">‹</div>
    <div class="nav-title"></div>
    <div class="nav-icons">
        <!-- 权益图标 + 徽章 -->
        <span class="nav-icon-btn" onclick="toggleRightsModal()">
            👑
            <span class="nav-badge rights" id="nav-rights-badge">0</span>
        </span>
        <!-- 宠豆图标 + 徽章 -->
        <span class="nav-icon-btn" onclick="toggleBeanModal()">
            🫘
            <span class="nav-badge bean" id="nav-bean-badge">0</span>
        </span>
    </div>
</div>
```

### 2.4 CSS样式

```css
/* 导航图标容器 */
.nav-icon-btn {
    font-size: 20px;
    cursor: pointer;
    position: relative;
}

/* 徽章基础样式 */
.nav-badge {
    position: absolute;
    top: -5px;
    right: -8px;
    min-width: 16px;
    height: 16px;
    padding: 0 4px;
    border-radius: 8px;
    font-size: 11px;
    font-weight: 700;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
}

/* 宠豆徽章（橙黄色） */
.nav-badge.bean {
    background: linear-gradient(135deg, #FFB300 0%, #FF9800 100%);
    color: #fff;
}

/* 权益徽章（紫色） */
.nav-badge.rights {
    background: linear-gradient(135deg, #9C27B0 0%, #7B1FA2 100%);
    color: #fff;
}
```

### 2.5 JavaScript配置

```javascript
// 徽章系统API配置
const EQUITY_API = {
    BASE_URL: 'http://192.168.2.147:19000',
    CIPHER: 'S6e48Sd452rATJ/0L7XYvw==',
    USER_ID: '16',
    TOKEN_REFRESH_INTERVAL: 7200000  // 2小时
};

// 全局状态
let equityApiToken = null;      // Token
let beanBalance = 0;            // 宠豆余额
let rightsCount = 0;            // 权益次数
```

### 2.6 Token刷新机制

```javascript
// 刷新Token
async function refreshEquityToken() {
    const response = await fetch(`${EQUITY_API.BASE_URL}/api/dx/register`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ cipher: EQUITY_API.CIPHER })
    });
    const result = await response.json();
    if (result.code === 200 && result.data?.info) {
        equityApiToken = result.data.info;
    }
}

// 启动定时刷新（页面加载时调用）
function startEquityTokenRefresh() {
    refreshEquityToken();  // 立即执行一次
    // 定时器：每2小时刷新一次
    setInterval(refreshEquityToken, EQUITY_API.TOKEN_REFRESH_INTERVAL);
    // 页面切回时刷新
    document.addEventListener('visibilitychange', () => {
        if (!document.hidden) refreshEquityToken();
    });
}
```

### 2.7 徽章数据加载

```javascript
// 加载宠豆余额
async function loadBeanBalance() {
    const response = await fetch(`${EQUITY_API.BASE_URL}/api/petCoin/balance`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'info': getEquityToken(),
            'id': EQUITY_API.USER_ID
        }
    });
    const result = await response.json();
    if (result.code === 200 && result.data) {
        beanBalance = result.data.coinAmount || 0;
        updateNavBadges();
    }
}

// 更新徽章显示
function updateNavBadges() {
    document.getElementById('nav-bean-badge').textContent = beanBalance;
    document.getElementById('nav-rights-badge').textContent = rightsCount;
}
```

### 2.8 初始化顺序

```javascript
document.addEventListener('DOMContentLoaded', () => {
    // 1. 启动Token刷新
    startEquityTokenRefresh();
    // 2. 加载宠豆余额
    loadBeanBalance();
    // 3. 加载权益次数
    loadRightsCount();
});
```

---

## 三、开发流程

### 3.1 新识别页面开发流程

```
1. 配置 SUB_MODULE_TYPE 和 PET_PROFILE_ID
2. 复制徽章系统（HTML + CSS + JavaScript）
3. 接入识别流程API
4. 删除报告页不需要的元素（如有需要，用户会单独说明）
5. 测试徽章显示
6. 测试识别流程
```

### 3.2 徽章系统复制清单

- [ ] HTML: 导航栏结构（含徽章元素）
- [ ] CSS: .nav-badge 系列样式
- [ ] JS: EQUITY_API 配置
- [ ] JS: Token管理函数
- [ ] JS: 宠豆余额函数
- [ ] JS: 权益次数函数
- [ ] JS: 弹窗控制函数
- [ ] JS: DOMContentLoaded 初始化

### 3.3 权益类型映射

| 类型码 | 名称 |
|--------|------|
| 1 | 品种识别 |
| 2 | 图像情绪识别 |
| 3 | 声音情绪识别 |
| 4 | 多模态情绪识别 |
| 5 | 吠叫识别 |
| 7 | 皮肤检测 |
| 8 | 口腔检测 |
| 9 | 耳道检测 |
| 10 | 眼睛检测 |
| 11 | 排泄物检测 |
| 12 | 呕吐物检测 |
| 15 | AI起名 |

---

## 四、API接口

### 4.1 徽章系统接口 (147服务器)

| 接口 | 方法 | 说明 |
|------|------|------|
| /api/dx/register | POST | 获取Token |
| /api/petCoin/balance | POST | 查询宠豆余额 |
| /api/userEquity/records | POST | 个人权益明细 |
| /api/petCoin/consumptionList | POST | 宠豆消费记录 |

**请求头**：
```
info: <token>
id: <userId>
```

### 4.2 AI识别接口 (148服务器)

| 接口 | 说明 |
|------|------|
| /api/dx/register | 获取Token |
| /api/pet-ai-recognition/session-start | 创建会话 |
| /api/pet-ai-recognition/upload-image | 上传图片 |
| /api/pet-ai-recognition/generate-and-get-report | 生成报告 |

### 4.3 接口调用时机

- **Token刷新**: 页面加载时、定时每2小时、页面切回时
- **徽章数据**: 页面加载时、点击弹窗时重新拉取
- **识别流程**: 用户点击识别按钮后按顺序调用

---

## 五、问题记录

### 5.1 记录位置

- 每个项目: `问题记录_项目名.md`
- 汇总文件: `C:\work\问题总结\问题记录汇总.md`

### 5.2 记录格式（示例）

```markdown
## 2026-02-09

### 问题: records.map is not a function

**现象**: 宠豆消费记录接口返回数据结构是 `{ data: { list: [...] } }`，代码直接用了 `result.data`

**原因**: 数据结构解析错误

**解决**: 修改为 `result.data?.list || result.data`

---

### 问题: 权益API Token刷新失败

**现象**: 代码检查 `result.data.token`，实际返回 `result.data.info`

**原因**: 字段名不匹配

**解决**: 修改为 `result.data.info`
```

---

## 六、参考文档

| 文档 | 说明 |
|------|------|
| 导航徽章系统复用文档.md | 徽章系统详细说明 |
| 前后端API联调开发经验指南.md | API联调经验 |
| 问题记录汇总.md | 历史问题汇总 |

---

## 文档更新记录

| 版本 | 日期 | 说明 |
|------|------|------|
| v1.0.0 | 2026-02-09 | 初始版本，基于宠物排泄物识别页面整理 |
