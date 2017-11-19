#!/bin/bash

EXPPATH=/home/james/files/expect

#gpg -d ~/.pdaqpasswd >/dev/null

#expcont_lc_tail_w.exp

#tmux new-session ${EXPPATH}/access_term.exp \; \
#  split-window -d -v -p 92 ${EXPPATH}/expcont_lc_tail.exp \; \
#  split-window -h ${EXPPATH}/expcont_term.exp \; \
#  split-window -h -t bottom -p 66 ${EXPPATH}/expcont_wlc.exp \; \
#  split-window -h -p 50 ${EXPPATH}/expcont_wds.exp \; \
#  split-window -t right -p 35 ${EXPPATH}/evbuilder_ls_tail.exp \; \
#  split-window -p 20 ${EXPPATH}/evbuilder_ls_wc.exp
#  split-window -h -t middle -p 20 ${EXPPATH}/access_term.exp \; \

tmux new-session ${EXPPATH}/expcont_term.exp \; \
  split-window -h -t top ${EXPPATH}/access_term.exp \; \
  split-window -t left \; \
  split-window -t right \; \
  new-window  \; \
  split-window -h -p 66 ${EXPPATH}/expcont_lc_tail.exp \; \
  split-window -p 20 ${EXPPATH}/expcont_term.exp \; \
  split-window -p 50 ${EXPPATH}/access_term.exp \; \
  split-window -h -t top -p 50 ${EXPPATH}/expcont_wds.exp \; \
  split-window -p 10 ${EXPPATH}/evbuilder_ls_wc.exp

#${EXPPATH}/expcont_wlc.exp

