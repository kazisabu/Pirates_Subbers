#!/bin/bash
# Creator : K4z1_S466iR
# Telegram : @Hexogonal
# Usage: ./Pirates_Subbers.sh <domain>

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

TIMEOUT=60
VERBOSE=false
OUTPUT_DIR=""
TEMP_DIR="/tmp/subfinder_$$"
print_banner() {
    echo -e "${PURPLE}"
    cat <<'EOF'
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣛⠿⣿⡿⠿⣿⣿⣬⡻⣷⡥⣊⡛⢿⡿⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⢪⢿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⡿⣫⣿⢟⣻⣿⣿⣷⡿⣩⣿⣯⣜⣹⢛⢿⣶⢑⣛⢏⣿⣼⣿⣿⣿⣿⣿⣿⡹⣿⣿⣿⣿⣿⣿⢾⢿⣧⢻⣿⣿⣿⣿⣿⣿⣿
⣿⣿⠿⡋⣺⢋⣑⣿⢿⡿⣫⣽⢰⣿⡟⣟⣿⣿⣷⣥⣙⣷⠶⣢⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡾⣿⣮⡞⣿⣿⣿⣿⣿⣿⣿
⣿⠿⢍⠩⢖⣛⣿⣇⠢⣾⣿⡇⣿⡿⣿⢻⢻⣟⣫⡝⣾⣷⣶⣿⣿⣿⣿⣿⣿⣿⣿⡻⠿⣿⣿⣿⡟⣿⢳⢱⡹⣼⣷⢹⣿⣿⣿⣿⣿⣿
⣼⠟⣡⣾⣿⣿⣿⡿⣺⣦⣾⣽⣿⣷⣿⣿⣩⣢⣿⣿⣿⡿⠿⣟⣛⣭⣭⣷⣶⣶⣶⣾⣿⣿⣿⣶⠲⠾⢥⣵⣓⡿⢹⢸⣿⣿⢿⣿⣿⣿
⣿⠸⣿⣿⣿⣿⡿⠣⢿⡿⠿⢹⡏⣿⣱⣣⣿⠻⣙⣥⣵⠾⢛⣿⣿⣿⣿⣿⣿⣿⣯⣭⡿⠿⠿⠿⣒⣋⣹⣤⣬⣭⣗⢲⣖⡛⢛⣻⣿⡿
⣿⣷⣶⣯⣭⣵⣶⣿⣿⣿⣿⢨⡞⠙⠘⠉⠀⠉⠉⣭⣴⣾⡿⠿⢟⣛⣛⣭⣭⣵⠶⣖⡤⣙⡻⢿⣿⣿⢿⣛⣿⣿⣷⣿⣿⣿⠿⠋⠕⠈
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡜⡀⠀⠀⢀⣀⣠⣬⣥⣴⠒⣿⣿⣿⣿⡿⠿⣿⡯⠭⢿⣷⡒⠯⢍⣿⣿⣭⣥⠞⠋⠉⠉⠉⠀⠀⠀⠀⠀
⣿⣿⠿⠿⢟⣛⣛⣻⣍⢉⡢⠔⣒⣰⠞⠛⣳⣶⣾⣿⣷⣿⣿⣿⣿⣿⣷⣶⣿⣟⣓⣶⣟⣛⣛⠲⠾⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣚
⣾⣿⣿⣿⣿⣿⠫⢕⡛⠛⠛⠛⠻⠭⠜⠿⠿⠛⠛⠁⠘⠿⠿⠛⠛⠋⠉⠝⠃⠛⠛⠹⠍⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿
⠘⠉⠈⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠠⣶⠐⣶⣶⣿⣿⣯⣵⡆⣦⡀⢡⡆⠀⠀⡴⢋⠡⠀⠀⠀⢢⣴⣼
⣿⣶⣶⣶⣤⣤⣤⣤⣤⣤⠄⠀⡀⠀⡎⡓⢦⢀⠀⢀⣀⣤⣾⣿⣿⢠⣏⠀⢸⠿⣿⣿⣿⣿⣿⣿⣿⡨⠍⠁⠀⠁⠀⢀⠀⠰⣦⡀⣿⣿
⣿⣿⣿⣿⣿⡿⠫⠒⠒⠭⡒⢿⡇⢀⠃⢉⠈⠘⣷⣼⣿⣿⣿⣿⣿⣦⣅⣀⣼⣾⣿⣿⣿⣿⣿⣿⣿⠾⠁⠂⠠⠰⢀⢆⣶⣄⣿⣿⣿⣿
⣿⣿⣿⣿⣿⢡⠁⠀⠀⠀⠀⠑⠑⠻⣎⢈⠰⠀⢹⣿⣿⣿⣿⣿⣿⣿⡿⠿⣛⣛⣛⣛⣛⣛⡿⢿⣯⠐⠌⠀⣠⡴⢫⣾⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⢸⠀⠀⠀⠀⠀⠀⠀⠀⠈⠓⢕⢶⣄⢻⣿⠟⢿⣿⢋⣥⣾⡿⠟⠛⠛⠛⣿⣿⣿⠹⠝⠓⠀⠀⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠙⢴⡝⣿⣿⣿⣿⣶⣶⣾⣶⣿⣿⣿⣿⠚⠀⠀⠀⠀⠘⠿⠿⠿⢿⡟⠛⠫⠭⠛
⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⢿⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡀⠀⠀⠈⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⡿⠛⠛⠉⠉⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣷⣍⡀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣶⣄⡀⢀⣀⣠⣼⠿⣚⣥⢊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠙⢿⣿⣷⣶⣶⣶⣿⣿⡇⢨⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣶⡈⣿⣿⣿⣿⣿⣿⣿⡏⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢸⣿⣿⣿⣿⣧⢹⣿⣿⣿⣿⣿⣿⢁⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣿⣿⣿⣿⣿⣿⠈⣿⣿⣿⣿⣿⡟⢸⣿⢻⢿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠈⣝⡛⠿⣿⣿⡂⠘⣿⣿⣿⣿⡇⢸⣇⢆⡠⠙⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
        ☠ PIRATES OF THE DEAD FLAG ☠
        By - K4z1
EOF
    echo -e "${NC}"
}
log() {
    local level=$1
    local message=$2
    local timestamp=$(date '+%H:%M:%S')
    
    case $level in
        "INFO")     echo -e "${timestamp} ${BLUE}[INFO]${NC} $message" ;;
        "SUCCESS")  echo -e "${timestamp} ${GREEN}[✓]${NC} $message" ;;
        "WARNING")  echo -e "${timestamp} ${YELLOW}[!]${NC} $message" ;;
        "ERROR")    echo -e "${timestamp} ${RED}[✗]${NC} $message" ;;
        "VERBOSE")  [[ $VERBOSE == true ]] && echo -e "${timestamp} ${CYAN}[DEBUG]${NC} $message" ;;
    esac
}
show_help() {
    echo -e "${CYAN}Usage: $0 <domain> [options]${NC}"
    echo ""
    echo -e "${WHITE}Options:${NC}"
    echo "  -v, --verbose       Enable verbose output"
    echo "  -o, --output FILE   Output file (default: <domain>_subdomains.txt)"
    echo "  -t, --timeout SEC   Timeout per source (default: 30)"
    echo "  -h, --help          Show this help"
    echo ""
    echo -e "${WHITE}Examples:${NC}"
    echo "  $0 example.com"
    echo "  $0 example.com -v -o results.txt"
    echo "  $0 example.com --timeout 60"
}
check_deps() {
    local missing=()
    for cmd in curl jq grep sed sort; do
        if ! command -v "$cmd" &>/dev/null; then
            missing+=("$cmd")
        fi
    done
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        log "ERROR" "Missing dependencies: ${missing[*]}"
        log "INFO" "Install with: sudo apt install ${missing[*]}"
        exit 1
    fi
}
setup_temp() {
    mkdir -p "$TEMP_DIR"
    log "VERBOSE" "Created temp directory: $TEMP_DIR"
}

# Cleanup function
cleanup() {
    [[ -d "$TEMP_DIR" ]] && rm -rf "$TEMP_DIR"
    log "VERBOSE" "Cleaned up temporary files"
}

trap cleanup EXIT
enum_crtsh() {
    log "INFO" "Querying crt.sh..."
    local output="$TEMP_DIR/crtsh.txt"

    timeout $TIMEOUT curl -s "https://crt.sh/?q=%25.$DOMAIN&output=json" 2>/dev/null \
        | jq -r '.[].name_value' 2>/dev/null \
        | sed 's/\*\.//g' \
        | grep -E "\.$DOMAIN$" \
        | grep -v "^$DOMAIN$" \
        | sort -u > "$output" 2>/dev/null
    

    timeout $TIMEOUT curl -s "https://crt.sh/?q=$DOMAIN&output=json" 2>/dev/null \
        | jq -r '.[].name_value' 2>/dev/null \
        | grep -Po '(\w+\.)*\w+\.'$DOMAIN'$' \
        | sed 's/\*\.//g' \
        | sort -u >> "$output" 2>/dev/null
    
    [[ -f "$output" ]] && sort -u "$output" -o "$output"
    
    local count=$(wc -l < "$output" 2>/dev/null || echo "0")
    log "SUCCESS" "crt.sh: Found $count subdomains"
}

enum_certspotter() {
    log "INFO" "Querying CertSpotter..."
    local output="$TEMP_DIR/certspotter.txt"
    
    timeout $TIMEOUT curl -s "https://api.certspotter.com/v1/issuances?domain=$DOMAIN&include_subdomains=true&expand=dns_names" 2>/dev/null \
        | jq -r '.[].dns_names[]?' 2>/dev/null \
        | grep -E "\.$DOMAIN$" \
        | grep -v "^\*\." \
        | sort -u > "$output" 2>/dev/null
    
    local count=$(wc -l < "$output" 2>/dev/null || echo "0")
    log "SUCCESS" "CertSpotter: Found $count subdomains"
}

enum_webarchive() {
    log "INFO" "Querying Web Archive..."
    local output="$TEMP_DIR/webarchive.txt"
    
    timeout $TIMEOUT curl -s "http://web.archive.org/cdx/search/cdx?url=*.$DOMAIN/*&output=text&fl=original&collapse=urlkey" 2>/dev/null \
        | sed -e 's_https*://__' -e 's/\/.*//' \
        | grep -E "\.$DOMAIN$" \
        | sort -u > "$output" 2>/dev/null
    
    local count=$(wc -l < "$output" 2>/dev/null || echo "0")
    log "SUCCESS" "Web Archive: Found $count subdomains"
}


enum_anubis() {
    log "INFO" "Querying JLDC Anubis..."
    local output="$TEMP_DIR/anubis.txt"
    timeout $TIMEOUT curl -s "https://jldc.me/anubis/subdomains/$DOMAIN" 2>/dev/null \
        | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" \
        | sed -e 's/https*:\/\///' \
        | grep -E "\.$DOMAIN$" \
        | sort -u > "$output" 2>/dev/null
    timeout $TIMEOUT curl -s "https://jldc.me/anubis/subdomains/$DOMAIN" 2>/dev/null \
        | jq -r '.[]?' 2>/dev/null \
        | grep -E "\.$DOMAIN$" \
        | sort -u >> "$output" 2>/dev/null
    [[ -f "$output" ]] && sort -u "$output" -o "$output"
    
    local count=$(wc -l < "$output" 2>/dev/null || echo "0")
    log "SUCCESS" "JLDC Anubis: Found $count subdomains"
}
enum_hackertarget() {
    log "INFO" "Querying HackerTarget..."
    local output="$TEMP_DIR/hackertarget.txt"
    
    timeout $TIMEOUT curl -s "https://api.hackertarget.com/hostsearch/?q=$DOMAIN" 2>/dev/null \
        | cut -d',' -f1 \
        | grep -E "\.$DOMAIN$" \
        | grep -v "^\*\." \
        | sort -u > "$output" 2>/dev/null
    
    local count=$(wc -l < "$output" 2>/dev/null || echo "0")
    log "SUCCESS" "HackerTarget: Found $count subdomains"
}
enum_alienvault() {
    log "INFO" "Querying AlienVault OTX..."
    local output="$TEMP_DIR/alienvault.txt"
    
    timeout $TIMEOUT curl -s "https://otx.alienvault.com/api/v1/indicators/domain/$DOMAIN/url_list?limit=100&page=1" 2>/dev/null \
        | grep -o '"hostname": *"[^"]*' \
        | sed 's/"hostname": "//' \
        | grep -E "\.$DOMAIN$" \
        | sort -u > "$output" 2>/dev/null
    
    local count=$(wc -l < "$output" 2>/dev/null || echo "0")
    log "SUCCESS" "AlienVault OTX: Found $count subdomains"
}
enum_subdomaincenter() {
    log "INFO" "Querying Subdomain Center..."
    local output="$TEMP_DIR/subdomaincenter.txt"
    
    timeout $TIMEOUT curl -s "https://api.subdomain.center/?domain=$DOMAIN" 2>/dev/null \
        | jq -r '.[]?' 2>/dev/null \
        | grep -E "\.$DOMAIN$" \
        | sort -u > "$output" 2>/dev/null
    
    local count=$(wc -l < "$output" 2>/dev/null || echo "0")
    log "SUCCESS" "Subdomain Center: Found $count subdomains"
}
enum_rapiddns() {
    log "INFO" "Querying RapidDNS..."
    local output="$TEMP_DIR/rapiddns.txt"
    
    timeout $TIMEOUT curl -s "https://rapiddns.io/subdomain/$DOMAIN?full=1" 2>/dev/null \
        | grep -oE "[\.a-zA-Z0-9-]+\.$DOMAIN" \
        | sort -u > "$output" 2>/dev/null
    
    local count=$(wc -l < "$output" 2>/dev/null || echo "0")
    log "SUCCESS" "RapidDNS: Found $count subdomains"
}
run_enumeration() {
    log "INFO" "Starting enumeration for: $DOMAIN"
    log "INFO" "Timeout per source: ${TIMEOUT}s"
    echo ""
    
    enum_crtsh &
    enum_certspotter &
    enum_webarchive &
    enum_anubis &
    enum_hackertarget &
    enum_alienvault &
    enum_subdomaincenter &
    enum_rapiddns &

    wait
    echo ""
}

consolidate_results() {
    log "INFO" "Consolidating results..."
    
    local all_results="$TEMP_DIR/all_combined.txt"
    local final_output="${OUTPUT_DIR:-${DOMAIN}_subdomains.txt}"
    
    cat "$TEMP_DIR"/*.txt 2>/dev/null | \
        grep -E "\.$DOMAIN$" | \
        grep -v "^$DOMAIN$" | \
        grep -v "^\s*$" | \
        sed 's/^[[:space:]]*//' | \
        sed 's/[[:space:]]*$//' | \
        sort -u > "$all_results"
    
    while IFS= read -r line; do
        if [[ "$line" =~ ^[a-zA-Z0-9][a-zA-Z0-9.-]*\.$DOMAIN$ ]]; then
            echo "$line"
        fi
    done < "$all_results" | sort -u > "$final_output"
    
    local total_count=$(wc -l < "$final_output" 2>/dev/null || echo "0")
    
    log "SUCCESS" "Consolidation complete!"
    log "SUCCESS" "Total unique subdomains: $total_count"
    log "SUCCESS" "Results saved to: $final_output"
    
    if [[ $VERBOSE == true ]]; then
        echo ""
        log "INFO" "Source breakdown:"
        for source_file in "$TEMP_DIR"/*.txt; do
            if [[ -f "$source_file" ]]; then
                local source=$(basename "$source_file" .txt)
                local count=$(wc -l < "$source_file" 2>/dev/null || echo "0")
                printf "  %-15s: %d subdomains\n" "$source" "$count"
            fi
        done
    fi
    
    echo ""
    if [[ $total_count -gt 0 ]]; then
        echo -e "${CYAN}Preview (first 10 results):${NC}"
        head -10 "$final_output" | sed 's/^/  /'
        if [[ $total_count -gt 10 ]]; then
            echo -e "  ${YELLOW}... and $((total_count - 10)) more${NC}"
        fi
    else
        log "WARNING" "No subdomains found for $DOMAIN"
    fi
    
    echo ""
    echo -e "${GREEN}Results saved to: $final_output${NC}"
}

validate_domain() {
    if ! [[ "$DOMAIN" =~ ^[a-zA-Z0-9][a-zA-Z0-9.-]*\.[a-zA-Z]{2,}$ ]]; then
        log "ERROR" "Invalid domain format: $DOMAIN"
        exit 1
    fi
}

main() {
    local DOMAIN=""
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -h|--help)
                print_banner
                show_help
                exit 0
                ;;
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -o|--output)
                OUTPUT_DIR="$2"
                shift 2
                ;;
            -t|--timeout)
                TIMEOUT="$2"
                shift 2
                ;;
            -*)
                log "ERROR" "Unknown option: $1"
                show_help
                exit 1
                ;;
            *)
                if [[ -z "$DOMAIN" ]]; then
                    DOMAIN="$1"
                else
                    log "ERROR" "Multiple domains specified. Use one domain at a time."
                    exit 1
                fi
                shift
                ;;
        esac
    done
    
    if [[ -z "$DOMAIN" ]]; then
        print_banner
        log "ERROR" "Domain is required"
        show_help
        exit 1
    fi
    
    validate_domain
    print_banner
    check_deps
    setup_temp
    run_enumeration
    consolidate_results
    
    echo -e "${GREEN}✓ Enumeration completed successfully!${NC}"
}
main "$@"
