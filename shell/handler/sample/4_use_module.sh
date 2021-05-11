# In this example, we introduce modules to our handler by "importModule", so we
# can call functions defined in modules.
#
# Modules make our code reusable and maintainable.
# 
# In general, it won't hurt to switch the order of importModule's.
# You can even import the same module twice, which is just OK.
#
# Though importModule is offen placed at the begining of the handler which may look like non-bash syntax, you may
# feel free to place it anywhere because it is JUST a function defined in bin/bashw
#
# By defaut modules are defined in the directory module

importModule 'log'
importModule 'util'

handler_main(){

    # use function in log module for logging
    logInfo "Begin with arguments: $@"

    # use function in util module to check arugments
    local firstArg="$1"
    util_assertArgumentNotEmpty "$firstArg" "firstArg"

    logEcho "first arg: $firstArg"
    
    # do other business
}