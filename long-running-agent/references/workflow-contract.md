# Workflow Contract (User-Centric)

## Decision Ownership

- 用户是最终裁定官。
- 用户介入时，用户决策覆盖默认规则。
- 用户未介入时，Agent 按约束文件自动验收。

## Required Clarification Depth

在出计划前完成多轮澄清，至少覆盖：
1. 目标结果（可观察）
2. 范围边界（明确不做什么）
3. 验收标准（如何判断完成）
4. 风险限制（时间、稳定性、兼容性）

## Execution Constraints

1. 一次一个任务，不并发扩散。
2. 任务完成前不得切换下一项。
3. 每轮必须给出证据：
- 代码测试结果
- 浏览器实测结果
- 变更文件列表
- 风险与后续建议
4. 任务与日志使用标准命名：`task.json`、`progress.txt`。
5. 提交必须原子化：单任务单 commit，且同步更新 `task.json` 与 `progress.txt`。

## Change Control

任何中途变更必须执行：
1. 更新需求或约束
2. 用户确认
3. 重排任务基线
4. 继续执行

## Stop Conditions

出现以下任一项必须暂停并请求用户裁定：
- 环境权限不足
- 第三方服务不可达
- 验收标准冲突
- 浏览器实测无法执行
