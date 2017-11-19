#!/bin/bash

#----------------------------------------------------
# this function opens a terminal on OS X
# and immediately runs a command and 
# resizes the window (parameter 1)
#----------------------------------------------------
function new_win {
#----------------------------------------------------
    gnome-terminal --geometry $1 -e "$2"
}

function new_tab_win {
    gnome-terminal --geometry $1 --tab -e "$2" --active --tab
}


#----------------------------------------------------
# MAIN
#----------------------------------------------------

# where are the `expect`-scripts located?
dir_i3op=~/files/i3operator/i3operator

# read pdaq's password
#echo -n "Password for pdaq: "
#read -s pwd
#echo

#---------------------------------------
# open all the terminals

# livecmd tail
#new_win 109x37+0+25     $dir_i3op/expcont_lc_tail.exp \'$pwd\'
new_win 81x44+17+30     $dir_i3op/expcont_lc_tail.exp

# only the warnings from livecmd tail
#new_win 109x18+0+598    $dir_i3op/expcont_lc_tail_w.exp \'$pwd\'
new_win 81x18+17+795    $dir_i3op/expcont_lc_tail_w.exp

# watch livecmd check
#new_win 77x61+783+25    $dir_i3op/expcont_wlc.exp \'$pwd\'
new_win 81x66+700+30    $dir_i3op/expcont_wlc.exp

# watch pdaq status
#new_win 52x24+1535+25   $dir_i3op/expcont_wds.exp \'$pwd\'
new_win 56x23+1390+30   $dir_i3op/expcont_wds.exp

# watch list of files on evbuilder
#new_win 60x15+0+910     $dir_i3op/evbuilder_ls_tail.exp \'$pwd\'
new_win 56x13+1390+465     $dir_i3op/evbuilder_ls_tail.exp 

# watch number of files on evbuilder
#new_win 26x15+440+910   $dir_i3op/evbuilder_ls_wc.exp \'$pwd\'
new_win 56x5+1390+735   $dir_i3op/evbuilder_ls_wc.exp

# watch ping
#new_win 56x13+637+940   $dir_i3op/localhost_pingloop.exp
new_win 56x13+1390+875   $dir_i3op/localhost_pingloop.exp

# terminal on expcont
#new_win 121x23+1052+798 $dir_i3op/expcont_term.exp \'$pwd\'
new_tab_win 80x24+1940+500 $dir_i3op/expcont_term.exp

# terminal on access
# you need to type in your personal password on access
# hence it should be opened last because then it stays in focus
#new_win 121x23+1052+421 $dir_i3op/access_term.exp
new_tab_win 80x24+1940+17 $dir_i3op/access_term.exp

# Start Firefox 
$dir_i3op/start_firefox.sh
