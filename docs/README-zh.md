<h1 align="center">
AcadHomepage
</h1>

<div align="center">

[![](https://img.shields.io/github/stars/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io)
[![](https://img.shields.io/github/forks/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io)
[![](https://img.shields.io/github/issues/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io)
[![](https://img.shields.io/github/license/RayeRen/acad-homepage.github.io)](https://github.com/RayeRen/acad-homepage.github.io/blob/main/LICENSE)  | [English README](../README.md)

</div>

<p align="center">一个现代、响应式的学术个人主页</p>

<p align="center">
    <br>
    <img src="./screenshot.png" width="100%"/>
    <br>
</p>

一些示例：
- [演示页面](https://rayeren.github.io/acad-homepage.github.io/)
- [作者个人主页](https://rayeren.github.io/)

## 核心功能
- **自动更新 Google Scholar 引用统计**：借助 Google Scholar 爬虫和 GitHub Actions，本仓库可以自动更新作者总引用数和单篇论文引用数。
- **支持 Google Analytics**：只需简单配置，就可以跟踪主页访问流量。
- **响应式设计**：主页会自动适配不同屏幕尺寸和视口。
- **美观且简洁**：整体风格简洁清晰，适合学术个人主页。
- **SEO**：搜索引擎优化（SEO）有助于搜索引擎更容易发现你在主页上发布的信息，并与同类网站进行排序比较。

## 快速开始

1. Fork 这个仓库，并将仓库重命名为 `USERNAME.github.io`，其中 `USERNAME` 是你的 GitHub 用户名。
1. 配置 Google Scholar 引用统计爬虫：
   1. 在你的 Google Scholar 主页 URL 中找到 scholar ID。例如：`https://scholar.google.com/citations?user=SCHOLAR_ID`，其中 `SCHOLAR_ID` 就是你的 Google Scholar ID。
   1. 在仓库网页的 `Settings -> Secrets -> Actions -> New repository secret` 中创建变量 `GOOGLE_SCHOLAR_ID`，其中 `name=GOOGLE_SCHOLAR_ID`，`value=SCHOLAR_ID`。
   1. 打开仓库网页的 `Actions` 页面，点击 `I understand my workflows, go ahead and enable them` 启用工作流。该 GitHub Action 会在仓库的 `google-scholar-stats` 分支生成 Google Scholar 引用统计文件 `gs_data.json`。当你更新主分支时，这个 Action 会自动触发；它也会在每天 `08:00 UTC` 自动运行一次。
1. 使用 [favicon-generator](https://redketchup.io/favicon-generator) 生成 favicon，并将下载得到的所有文件放到 `REPO/images` 目录下。
1. 修改主页配置文件 [`_config.yml`](../_config.yml)：
   1. `title`：主页标题。
   1. `description`：主页描述。
   1. `repository`：`USER_NAME/REPO_NAME`。
   1. `google_analytics_id`（可选）：Google Analytics ID。
   1. SEO 相关字段（可选）：从搜索引擎站长平台获取，例如 Google、Bing、Baidu。
   1. `author`：主页作者信息，包括其他网站、邮箱、城市、学校等。
   1. 更多配置细节请查看文件中的注释。
1. 将你的主页内容写入 [`_pages/about.md`](../_pages/about.md)。
   1. 你可以像普通 Jekyll 页面一样使用 `HTML + Markdown` 混合语法。
   1. 你可以用带有 `show_paper_citations` 类和 `data` 属性的 `<span>` 标签显示某篇论文的引用数。把 `data` 设置为该论文的 Google Scholar 论文 ID。例如：
      ```html
      <span class='show_paper_citations' data='DhtAFkwAAAAJ:ALROH1vI_8AC'></span>
      ```
      > 问：如何获得 Google Scholar 论文 ID？  
      > 答：进入你的 Google Scholar 主页，点击论文标题，在 URL 中找到 `citation_for_view=XXXX`，其中 `XXXX` 就是所需的论文 ID。
1. 你的主页会发布到 `https://USERNAME.github.io`。

## 本地调试

1. 使用 `git clone` 将你的仓库克隆到本地。
1. 根据 [安装指南](https://jekyllrb.com/docs/installation/#requirements) 安装 Jekyll 构建环境，包括 `Ruby`、`RubyGems`、`GCC` 和 `Make`。
1. 运行 `bash run_server.sh` 启动 Jekyll 实时重载服务器。
1. 在浏览器中打开 `http://127.0.0.1:4000`。
1. 如果你修改了网站源码，实时重载服务器会自动刷新页面。
1. 完成修改后，使用 `git` 提交并推送你的更改到远程仓库。

# 致谢

- AcadHomepage 集成了 Font Awesome，其发布协议为 SIL OFL 1.1 和 MIT License。
- AcadHomepage 受 GitHub 仓库 [mmistakes/minimal-mistakes](https://github.com/mmistakes/minimal-mistakes) 影响，该仓库使用 MIT License。
- AcadHomepage 受 GitHub 仓库 [academicpages/academicpages.github.io](https://github.com/academicpages/academicpages.github.io) 影响，该仓库使用 MIT License。
