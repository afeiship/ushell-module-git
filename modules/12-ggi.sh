#!/usr/bin/expect

# 设置超时时间（-1 表示无超时）
set timeout -1

spawn git add .

# 启动 aic2 命令
spawn aic2 --all -y

# 禁用日志输出
log_user 0


# 等待交互提示
expect {
    "Pick a commit message to use:" {
        # 模拟按下回车键选择默认选项
        send "\r"
        exp_continue
    }
    eof
}

# 启用日志输出（仅对 git push 的结果显示）
log_user 1

# 在完成 aic2 后执行 git push
spawn git push

# 捕获 git push 的输出并结束脚本
expect eof

