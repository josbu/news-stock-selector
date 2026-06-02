#!/usr/bin/env bash
set -e

echo "========================================="
echo "  新闻选股助手 (News Stock Selector) 安装"
echo "  v3.6.0"
echo "========================================="

SKILL_DIR="$HOME/.claude/skills/news-stock-selector"
REPO_URL="https://github.com/AXBIAO/news-stock-selector.git"

# 1. Clone
if [ ! -d "$SKILL_DIR" ]; then
  echo ""
  echo "[1/4] 克隆仓库..."
  git clone "$REPO_URL" "$SKILL_DIR"
else
  echo ""
  echo "[1/4] 目录已存在，跳过克隆"
fi

# 2. Install Python deps
echo ""
echo "[2/4] 安装 Python 依赖..."
pip install tushare akshare requests

# 3. Done
echo ""
echo "[3/4] Skill 已安装到: $SKILL_DIR"
echo ""
echo "[4/4] 接下来手动配置以下内容："
echo ""
echo "  📌 配置 MCP Router (搜索/新闻/K线/指数 工具):"
echo "     编辑 ~/.claude/mcp.json，添加："
echo ""
echo '     "mcp-router": {'
echo '       "command": "npx",'
echo '       "args": ["-y", "@mcp_router/cli@latest", "connect"],'
echo '       "env": { "MCPR_TOKEN": "你的MCPR_TOKEN" }'
echo '     }'
echo ""
echo "  📌 配置 TuShare (行情数据):"
echo '     export TUSHARE_TOKEN="你的TUSHARE_TOKEN"'
echo '     export TUSHARE_HTTP_URL="你的TUSHARE_HTTP_URL"'
echo ""
echo "  📌 配置报告输出目录 (可选):"
echo '     export NEWS_STOCK_REPORT_DIR="$HOME/新闻选股报告"'
echo ""
echo "========================================="
echo "  安装完成！重启 Claude Code 即可使用"
echo "========================================="
