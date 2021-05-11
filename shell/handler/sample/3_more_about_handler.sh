# In this example, you will see more about handler: invoking a function.
# All handler is by default failed-fast, AKA stop executing as soon as it meet a statement with non-zero code.
handler_main(){
    echo "More abount the handler!"
    echo "Failed-fast"

    _handler_checkSomething

    # since _handler_checkSomething is failed, any code afterwards won't be reachable
    echo "this code won't be executed"
}


# It's recommended to name you function with the module, in this case we use `handler`
# Function starts with _ is telling others this should be a private function
_handler_checkSomething(){
    # mock a failed checking process
    return 1
}