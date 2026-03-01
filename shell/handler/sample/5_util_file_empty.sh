# This example demonstrates the new util_isFileEmpty function.
# It shows how to check if a file exists and is empty.

importModule 'log'
importModule 'util'

handler_main(){
    logInfo "Testing util_isFileEmpty function"
    
    # Create temporary test files using mktemp to avoid conflicts
    local empty_file=$(mktemp)
    local non_empty_file=$(mktemp)
    local non_existent_file="/tmp/non_existent_$(date +%s)_$$"
    
    # Ensure cleanup even if script fails
    trap 'rm -f "$empty_file" "$non_empty_file"' EXIT
    
    # Create empty file (mktemp already creates empty file)
    
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
    
    logInfo "util_isFileEmpty test completed successfully"
}