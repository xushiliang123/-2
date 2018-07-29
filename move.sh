
find ./ -name LL*.xib|sed 's/\(.*\)\(LL\)\(.*\)/mv \1\2\3 \1MY_LL\3/' | sh
find ./ -name LL*.h|sed 's/\(.*\)\(LL\)\(.*\)/mv \1\2\3 \1MY_LL\3/' | sh
find ./ -name LL*.m|sed 's/\(.*\)\(LL\)\(.*\)/mv \1\2\3 \1MY_LL\3/' | sh


find ./ -name LY*.xib|sed 's/\(.*\)\(LY\)\(.*\)/mv \1\2\3 \1MY_LY\3/' | sh
find ./ -name LY*.h|sed 's/\(.*\)\(LY\)\(.*\)/mv \1\2\3 \1MY_LY\3/' | sh
find ./ -name LY*.m|sed 's/\(.*\)\(LY\)\(.*\)/mv \1\2\3 \1MY_LY\3/' | sh


find ./ -name TT*.xib|sed 's/\(.*\)\(TT\)\(.*\)/mv \1\2\3 \1MY_TT\3/' | sh
find ./ -name TT*.h|sed 's/\(.*\)\(TT\)\(.*\)/mv \1\2\3 \1MY_TT\3/' | sh
find ./ -name TT*.m|sed 's/\(.*\)\(TT\)\(.*\)/mv \1\2\3 \1MY_TT\3/' | sh


find ./ -name XT*.xib|sed 's/\(.*\)\(XT\)\(.*\)/mv \1\2\3 \1MY_XT\3/' | sh
find ./ -name XT*.h|sed 's/\(.*\)\(XT\)\(.*\)/mv \1\2\3 \1MY_XT\3/' | sh
find ./ -name XT*.m|sed 's/\(.*\)\(XT\)\(.*\)/mv \1\2\3 \1MY_XT\3/' | sh


find ./ -name GL*.xib|sed 's/\(.*\)\(GL\)\(.*\)/mv \1\2\3 \1MY_GL\3/' | sh
find ./ -name GL*.h|sed 's/\(.*\)\(GL\)\(.*\)/mv \1\2\3 \1MY_GL\3/' | sh
find ./ -name GL*.m|sed 's/\(.*\)\(GL\)\(.*\)/mv \1\2\3 \1MY_GL\3/' | sh
