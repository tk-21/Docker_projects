# config/aliases.sh

# ディレクトリ一覧の詳細表示
alias ll='ls -la'

# Git のステータス確認
alias gs='git status'

# Git のプル
alias gp='git pull'

# Git のコミット
alias gc='git commit'

# MySQL の接続
alias mysqlc='mysql -u root -p'

# Apache のステータス確認
alias apache-status='ps aux | grep apache2'

# Apache の再起動
alias apache-restart='supervisorctl restart apache2'

# MySQL のステータス確認
alias mysql-status='ps aux | grep mysqld'

# MySQL の再起動
alias mysql-restart='supervisorctl restart mysqld'
