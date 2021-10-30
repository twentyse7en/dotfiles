# Credit ThePrimeagen

languages=`echo "python javascript react next django" | tr ' ' '\n'`
core_utils=`echo "xargs find sed awk" | tr ' ' '\n'`

selected=`echo "$languages\n$core_utils" | fzf --reverse`
# first time seeing read
read -p "qurey: " query


# neww create a new window if inside tmux
# new for  new session

if printf $languages | grep -qs $selected; then
	tmux new bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
	tmux neww bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
