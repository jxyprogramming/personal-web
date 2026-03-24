# Campus Notes Site

这是一个基于 `Astro + Cloudflare Pages + Supabase` 的个人网站模板，适合用来放：

- 课程笔记
- PDF 资料
- 生活感想
- 照片
- 来访者点赞和评论

当前项目已经可以本地运行，也已经通过构建检查。

## 1. 你现在已经有什么

这个项目已经包含：

- 首页
- 笔记列表页和详情页
- 感想列表页和详情页
- 照片列表页和详情页
- Markdown 内容系统
- Supabase 点赞和评论组件
- Cloudflare Pages 可部署配置
- 示例内容

主要目录：

- `src/content/notes`：课程笔记
- `src/content/posts`：感想/随笔
- `src/content/photos`：照片内容说明
- `src/pages`：网站页面
- `src/components/Engagement.astro`：点赞和评论区域
- `supabase/schema.sql`：Supabase 数据库初始化脚本
- `.env.example`：环境变量模板

## 2. 先怎么查看网页

在项目根目录 `/home/jiangxy/Documents/web` 运行：

```bash
npm install
npm run dev
```

启动后，终端通常会显示一个本地地址，例如：

```bash
http://localhost:4321
```

然后你在浏览器打开这个地址，就能看到网页。

如果端口被占用，Astro 可能会自动换成别的端口，按终端打印出来的网址打开就行。

## 3. 第一次上手建议你按这个顺序做

### 第一步：先本地看页面

运行：

```bash
npm run dev
```

确认下面这些页面都能打开：

- `/`
- `/notes`
- `/posts`
- `/photos`

### 第二步：试着改内容

你可以先编辑这些文件感受一下：

- [src/content/notes/operating-systems-week-3.md](/home/jiangxy/Documents/web/src/content/notes/operating-systems-week-3.md)
- [src/content/posts/first-spring-rain.md](/home/jiangxy/Documents/web/src/content/posts/first-spring-rain.md)
- [src/content/photos/library-window.md](/home/jiangxy/Documents/web/src/content/photos/library-window.md)

改完保存，浏览器一般会自动刷新。

### 第三步：配置 Supabase

如果你不配 Supabase，网站的静态页面仍然可以看，但点赞和评论不会正常工作。

你要做的是：

1. 去 Supabase 官网注册并创建一个项目
2. 找到项目的 `Project URL`
3. 找到项目的 `anon public key`
4. 在 Supabase SQL Editor 里执行 [supabase/schema.sql](/home/jiangxy/Documents/web/supabase/schema.sql)
5. 把 `.env.example` 复制成 `.env`
6. 把里面的值替换成你的 Supabase 信息

示例：

```bash
PUBLIC_SITE_URL=http://localhost:4321
PUBLIC_SUPABASE_URL=https://your-project.supabase.co
PUBLIC_SUPABASE_ANON_KEY=你的anon公钥
```

然后重新运行：

```bash
npm run dev
```

### 第四步：测试点赞和评论

打开任意一篇笔记或文章详情页，滚动到底部：

- 点击“点赞”按钮
- 输入昵称和评论
- 看是否能正常显示

## 4. 怎么新增内容

### 新增课程笔记

在 `src/content/notes` 下新建一个 Markdown 文件，例如：

```bash
computer-network-week-1.md
```

内容示例：

```md
---
title: "计算机网络 Week 1"
description: "整理分层模型和常见协议。"
publishedAt: 2026-03-24
course: "计算机网络"
semester: "2025-2026 春"
tags:
  - Network
  - 复习
pdfUrl: "https://example.com/your-file.pdf"
---

这里写你的笔记正文。
```

### 新增感想

在 `src/content/posts` 下新建 Markdown 文件。

### 新增照片

在 `src/content/photos` 下新建 Markdown 文件。

其中：

- `image` 填图片 URL
- 你现在可以先放图床链接
- 后面再迁移到 Supabase Storage

## 5. PDF 和照片以后怎么放更合适

你现在有两种做法：

### 简单做法

先把 PDF 和图片放在外链地址里。

优点：

- 上手快
- 不用立刻研究存储系统

### 更长期的做法

用 Supabase Storage 建 bucket：

- `documents`
- `photos`

然后把上传后的公开链接填到 Markdown frontmatter 里。

这更适合你以后资料越来越多的时候。

## 6. 最后怎么部署到 Cloudflare Pages

### 准备代码仓库

如果你还没建 Git 仓库，可以这样做：

```bash
git init
git add .
git commit -m "init personal site"
```

然后推到 GitHub。

### 在 Cloudflare Pages 上部署

1. 登录 Cloudflare
2. 打开 Pages
3. 选择连接你的 GitHub 仓库
4. 选择这个项目仓库
5. 构建配置填写：

```bash
Build command: npm run build
Build output directory: dist
```

6. 在环境变量里添加：

- `PUBLIC_SITE_URL`
- `PUBLIC_SUPABASE_URL`
- `PUBLIC_SUPABASE_ANON_KEY`

7. 点击部署

部署完成后，Cloudflare 会给你一个 `*.pages.dev` 域名。

## 7. 你以后怎么运营这个网站

如果你把它当成长期网站，我建议你这样维护：

### 内容运营节奏

- 每门课每周整理 1 次笔记
- 每周写 1 篇短感想
- 每月挑一些照片上传

### 内容结构建议

- 笔记尽量按“课程名 + 周次”命名
- 感想标题尽量具体，不要都叫“随笔”
- 标签保持稳定，比如 `OS`、`Database`、`校园`、`复习`

### 质量建议

- 笔记重在清晰，不一定要很长
- 每篇笔记最好有一句摘要
- PDF 附件只放真正有参考价值的资料
- 照片不要一次堆太多，挑最有代表性的

### 评论区建议

当前版本是免登录 MVP，所以建议你上线后观察一下：

- 是否有垃圾评论
- 是否需要改成登录后评论
- 是否需要增加敏感词过滤

如果评论垃圾太多，下一步就把它升级成 `Supabase Auth` 登录版。

## 8. 常用命令

安装依赖：

```bash
npm install
```

本地开发：

```bash
npm run dev
```

构建生产版本：

```bash
npm run build
```

预览构建结果：

```bash
npm run preview
```

## 9. 当前项目的已知说明

### tsconfig 报红

如果你的 IDE 之前把 `tsconfig.json` 第二行标红，我已经把它改成了更显式的：

```json
"extends": "astro/tsconfigs/strict.json"
```

这通常比不带 `.json` 的写法更容易被 IDE 正确识别。

### 点赞和评论的实现方式

当前是一个轻量 MVP：

- 点赞基于浏览器本地 token
- 评论基于昵称输入
- 不要求登录

这适合先上线体验，但安全性和反垃圾能力一般。

## 10. 我建议你接下来马上做什么

最适合你的下一步是：

1. 运行 `npm run dev`
2. 打开本地网址看页面
3. 修改一篇笔记试试
4. 注册 Supabase 并执行 SQL
5. 把 `.env` 配好
6. 再测试点赞和评论
7. 最后部署到 Cloudflare Pages

如果你愿意，我下一步可以继续直接帮你做两件很具体的事之一：

- 把首页文案、站点名称、配色改成更像你自己的风格
- 帮你一步一步配置 Supabase，我会直接告诉你后台每一项该点哪里
