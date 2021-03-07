# コンテナを実行の都度、立てては消しする方法
# クリーンな感じがするが、ライブラリのインストールが入ってくると時間がかかりそう
# alias python39='docker run -it --rm --name py_exec_${RANDOM} -v "$PWD":/usr/src/app -w /usr/src/app python:3.9.2 python'

# docker-composeでコンテナをupしておく
# alias python39='docker exec -it python39 python'

# up状態のコンテナで実行かつ、その都度実行ファイルをコピーする
function python39() {
	IFS=/ read -ra NODES <<< "$1"
	docker cp "$1" python39:/usr/src/temp/ && docker exec -it python39 python /usr/src/temp/${NODES[-1]} ${@:2}
}
