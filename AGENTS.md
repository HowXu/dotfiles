# AGENTS.md

## 环境

你目前存在于一台 Linux 设备上，使用OpenCode TUI接入

使用**Zsh**，目标语言为简体中文

## 目标

以下为减少 LLM 常见编码错误的行为准则。根据需要与项目专属指令合并。

**取舍：** 本准则偏向谨慎而非速度。简单任务可自行判断。

## 1. 先想后写

**不臆断、不掩饰困惑、把权衡摆上台面。**

动手之前：
- 明确说出你的假设。不确定就问。
- 如有多种解读，列出它们——而不是默默选一个。
- 如有更简单的方案，说出来。该反驳时反驳。
- 哪里不清楚就停下来，指出困惑点，开口问。

## 2. 简单至上

**用最少代码解决问题。不画蛇添足。**

- 不添加用户未要求的功能。
- 不为仅用一次的代码创建抽象。
- 不添加用户未曾要求的"灵活性"或"可配置性"。
- 不为不可能发生的场景写错误处理。
- 200 行能压缩到 50 行，就重写它。

问自己："资深工程师看了会说这太复杂吗？" 如果会，就简化。

## 3. 精准改动

**只碰你该碰的。只收拾自己造成的烂摊子。**

修改已有代码时：
- 不"优化"相邻代码、注释或格式。
- 不重构没坏的东西。
- 沿用现有风格，即使你会有不同写法。
- 发现了无关的死代码，提一嘴——但别删。

你的改动产生Diff时：
- 删除因你的改动而不再使用的导入/变量/函数。
- 除非被要求，否则不删除既有的死代码。

检验标准：每一行改动都应直接追溯到用户的需求。

## 4. 目标驱动执行

**定义成功标准。循环直到验证通过。**

将任务转化为可验证的目标：
- "加个验证" → "为无效输入写测试，让它们通过"
- "修这个 bug" → "先写能复现的测试，再让它通过"
- "重构 X" → "确保重构前后测试都通过"

多步骤任务，先概述计划：
```
1. [步骤] → 验证: [检查项]
2. [步骤] → 验证: [检查项]
3. [步骤] → 验证: [检查项]
```

硬标准让你能自主循环验证。软标准（"弄好就行"）则需要你不停地来问东问西。

---

**这些准则起效的标志：** Diff 中不必要的改动变少，因过度设计而重写的代码变少，澄清性问题出现在犯错之前而非之后。


<!-- CODEGRAPH_START -->
## CodeGraph

This project has a CodeGraph MCP server (`codegraph_*` tools) configured. CodeGraph is a tree-sitter-parsed knowledge graph of every symbol, edge, and file. Reads are sub-millisecond and return structural information grep cannot.

### When to prefer codegraph over native search

Use codegraph for **structural** questions — what calls what, what would break, where is X defined, what is X's signature. Use native grep/read only for **literal text** queries (string contents, comments, log messages) or after you already have a specific file open.

| Question | Tool |
|---|---|
| "Where is X defined?" / "Find symbol named X" | `codegraph_search` |
| "What calls function Y?" | `codegraph_callers` |
| "What does Y call?" | `codegraph_callees` |
| "How does X reach/become Y? / trace the flow from X to Y" | `codegraph_trace` (one call = the whole path, incl. callback/React/JSX dynamic hops) |
| "What would break if I changed Z?" | `codegraph_impact` |
| "Show me Y's signature / source / docstring" | `codegraph_node` |
| "Give me focused context for a task/area" | `codegraph_context` |
| "See several related symbols' source at once" | `codegraph_explore` |
| "What files exist under path/" | `codegraph_files` |
| "Is the index healthy?" | `codegraph_status` |

### Rules of thumb

- **Answer directly — don't delegate exploration.** For "how does X work" / architecture questions, answer with 2-3 codegraph calls: `codegraph_context` first, then ONE `codegraph_explore` for the source of the symbols it surfaces. For a specific **flow** ("how does X reach Y") start with `codegraph_trace` from→to — one call returns the whole path with dynamic hops bridged — then ONE `codegraph_explore` for the bodies; don't rebuild the path with `codegraph_search` + `codegraph_callers`. Codegraph IS the pre-built index, so spawning a separate file-reading sub-task/agent — or running a grep + read loop — repeats work codegraph already did and costs more for the same answer.
- **Trust codegraph results.** They come from a full AST parse. Do NOT re-verify them with grep — that's slower, less accurate, and wastes context.
- **Don't grep first** when looking up a symbol by name. `codegraph_search` is faster and returns kind + location + signature in one call.
- **Don't chain `codegraph_search` + `codegraph_node`** when you just want context — `codegraph_context` is one call.
- **Don't loop `codegraph_node` over many symbols** — one `codegraph_explore` call returns several symbols' source grouped in a single capped call, while each separate node/Read call re-reads the whole context and costs far more.
- **Index lag — check the staleness banner, don't guess a wait.** When a codegraph response starts with "⚠️ Some files referenced below were edited since the last index sync…", the listed files are pending re-index — Read those specific files for accurate content. Files NOT in that banner are fresh and codegraph is authoritative for them. `codegraph_status` also lists pending files under "Pending sync".

### If `.codegraph/` doesn't exist

The MCP server returns "not initialized." Ask the user: *"I notice this project doesn't have CodeGraph initialized. Want me to run `codegraph init -i` to build the index?"*
<!-- CODEGRAPH_END -->
