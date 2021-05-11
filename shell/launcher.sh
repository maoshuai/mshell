#!/usr/bin/env bash

#----------------------
# author:	maoshuai
# date:		2021-02-18
# desc:     The wrapper to kick-start app_main by bashw
#----------------------
# all job is launched by this method
launcher_main(){
    # MSHELL_HOME is the deployment home
    export MSHELL_HOME="$( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )"

    # start app_main function
    local bashw_exe="$MSHELL_HOME/lib/bashw/bashw"
    if [ ! -x $bashw_exe ];then
        chmod u+x $bashw_exe
    fi
    $bashw_exe -m "$MSHELL_HOME/module" app_main "$@"
}

launcher_main "$@"