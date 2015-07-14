etc="$1"
f="$2"
title=$(sed -n 2p "$f")
if  ! [[ "$f" = "../src/index" ]]; then
    head2="<h1>$title</h1>"
fi
(head="$title" head2="$head2" bash "$etc"/head.sh
 tail -n +3 "$f" 
 bash "$etc"/tail.sh)
