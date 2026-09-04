function fish-prof
    set -l profile "./fish.profile"
    set -l tab (printf '\t')

    command fish --profile-startup="$profile" -i -c exit

    set -l total_us 0
    set -l lines
    while read -l line
        set -l m (string match -r '^\s*([0-9]+)\s+([0-9]+)\s+(.*)$' -- "$line")
        if set -q m[2]
            if test $m[3] -gt $total_us
                set total_us $m[3]
            end
            set -a lines "$m[2]$tab$m[3]$tab$m[4]"
        end
    end < "$profile"

    printf 'Total startup time: %.0f ms\n' (math "$total_us / 1000")

    set -l order (for e in $lines
        printf '%s\n' "$e"
    end | sort -t"$tab" -k1,1rn)

    printf '%-9s %s\n' Time Command
    printf '%-9s %s\n' '--------' '-------'

    for entry in $order[1..25]
        set -l f (string split "$tab" -- "$entry")
        printf '%-9s %s\n' (printf '%.1fms' (math "$f[1] / 1000")) $f[3]
    end
end
