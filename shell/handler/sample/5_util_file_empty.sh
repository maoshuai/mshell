# This example demonstrates the new util_isFileEmpty function.
# It shows how to check if a file exists and is empty.

importModule 'log'
importModule 'util'

handler_main(){
    logInfo "Testing util_isFileEmpty function"
    
    # Use the job's log directory for test files to avoid conflicts
    local test_dir="${MSHELL_HOME}/shell/test_data/${MSHELL_PROFILE:-dev}/shell-log-${USER:-$(whoami)}/$(date +%Y%m%d)"
    mkdir -p "$test_dir"
    
    local empty_file="$test_dir/test_empty_$$"
    local non_empty_file="$test_dir/test_non_empty_$$"
    local non_existent_file="$test_dir/non_existent_$$"
    
    # Create empty file
    touch "$empty_file"
    
    # Create non-empty file  
    echo "test content" > "$non_empty_file"
    
    # Test empty file
    if util_isFileEmpty "$empty_file"; then
        logEcho "✓ File $empty_file is empty (correct)"
    else
        logEcho "✗ File $empty_file should be empty but isn't"
    fi
    
    # Test non-empty file
    if ! util_isFileEmpty "$non_empty_file"; then
        logEcho "✓ File $non_empty_file is not empty (correct)"
    else
        logEcho "✗ File $non_empty_file should not be empty"
    fi
    
    # Test non-existent file
    if [ $(util_isFileEmpty "$non_existent_file"; echo $?) -eq 2 ]; then
        logEcho "✓ Non-existent file handled correctly"
    else
        logEcho "✗ Non-existent file should return exit code 2"
    fi
    
    # Clean up test files
    rm -f "$empty_file" "$non_empty_file"
    
    logInfo "util_isFileEmpty test completed successfully"
}