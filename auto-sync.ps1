# Edenworks Website Auto Sync Script
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "    Edenworks Website Auto Sync" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Git 상태 확인
Write-Host "[1/4] Checking Git status..." -ForegroundColor Yellow
git status

# 변경사항이 있는지 확인
$status = git status --porcelain
if ($status) {
    Write-Host ""
    Write-Host "[2/4] Adding changes..." -ForegroundColor Yellow
    git add .
    
    # 커밋 메시지 입력
    Write-Host ""
    Write-Host "[3/4] Committing changes..." -ForegroundColor Yellow
    $commitMsg = Read-Host "Enter commit message (or press Enter for auto)"
    if ([string]::IsNullOrWhiteSpace($commitMsg)) {
        $commitMsg = "Auto sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    }
    git commit -m $commitMsg
    
    # GitHub에 푸시
    Write-Host ""
    Write-Host "[4/4] Pushing to GitHub..." -ForegroundColor Yellow
    git push origin main
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "    Sync completed successfully!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "No changes to sync!" -ForegroundColor Green
}

Write-Host ""
Read-Host "Press Enter to continue..."
