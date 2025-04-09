[private]
default:
	@just --list

new +name:
	zk new --no-input --title "{{name}}"
list:
	zk list --format oneline

edit:
	zk edit --interactive
