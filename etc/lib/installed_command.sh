#
# @(#) installed_command.sh
#
# Usage:
#   installed_command command_name
#     param1: コマンド名
#
# Description:
#   コマンドがシステムにインストールされているかを確認する関数である。
#   `source` コマンドなどでこのスクリプトを読み込んで使用する。
#
###########################################################################

function installed_command() {
    type $1 > /dev/null 2>&1
}
