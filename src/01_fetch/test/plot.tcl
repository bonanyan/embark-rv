set sigs [list]
lappend sigs "__bug_marker__"
lappend sigs "testbench.clock\[0\]"
lappend sigs "testbench.we\[31:0\]"
lappend sigs "testbench.addr\[15:0\]"
lappend sigs "testbench.d\[31:0\]"
lappend sigs "testbench.q\[31:0\]"

set added [ gtkwave::addSignalsFromList $sigs ]