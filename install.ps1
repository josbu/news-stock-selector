# 新闻选股助手 (News Stock Selector) 一键安装脚本
# v3.6.0

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  新闻选股助手 (News Stock Selector) 安装" -ForegroundColor Cyan
Write-Host "  v3.6.0" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

$SkillDir = "$env:USERPROFILE\.claude\skills\news-stock-selector"
$RepoUrl = "https://github.com/AXBIAO/news-stock-selector.git"

# 1. Clone
if (-not (Test-Path $SkillDir)) {
  Write-Host ""
  Write-Host "[1/4] 克隆仓库..." -ForegroundColor Yellow
  git clone $RepoUrl $SkillDir
} else {
  Write-Host ""
  Write-Host "[1/4] 目录已存在，跳过克隆" -ForegroundColor Yellow
}

# 2. Install Python deps
Write-Host ""
Write-Host "[2/4] 安装 Python 依赖..." -ForegroundColor Yellow
pip install tushare akshare requests

# 3. Done
Write-Host ""
Write-Host "[3/4] Skill 已安装到: $SkillDir" -ForegroundColor Green
Write-Host ""
Write-Host "[4/4] 接下来手动配置以下内容：" -ForegroundColor Yellow
Write-Host ""
Write-Host "  📌 配置 TuShare (行情数据):" -ForegroundColor White
Write-Host '     setx TUSHARE_TOKEN "你的TUSHARE_TOKEN"'
Write-Host '     setx TUSHARE_HTTP_URL "你的TUSHARE_HTTP_URL"'
Write-Host ""
Write-Host "  📌 配置报告输出目录 (可选):" -ForegroundColor White
Write-Host '     setx NEWS_STOCK_REPORT_DIR "%USERPROFILE%\Desktop\新闻选股报告"'
Write-Host ""
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  安装完成！重启 Claude Code 即可使用" -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Cyan
