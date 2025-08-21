@echo off
echo ========================================
echo    Edenworks Website Auto Sync
echo ========================================
echo.

:: Git 상태 확인
echo [1/4] Checking Git status...
git status

:: 변경사항 추가
echo.
echo [2/4] Adding changes...
git add .

:: 커밋
echo.
echo [3/4] Committing changes...
set /p commit_msg="Enter commit message (or press Enter for auto): "
if "%commit_msg%"=="" (
    set commit_msg="Auto sync: %date% %time%"
)
git commit -m %commit_msg%

:: GitHub에 푸시
echo.
echo [4/4] Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo    Sync completed successfully!
echo ========================================
pause
