# Author: Bulat Giniyatullin

# 1
sed -ne '/^[^b]\{7\}$/p' file

# 2
sed -e 's/\t/ /g' file

# 3
sed -e '/\.$/a\Красная строка' file

# 4
sed -e '/^[^abcde]*$/p' file

# 5
sed -nE '3~3{/[^0-9][,.][1-9][0-9][^,.0-9]|[^,.0-9][1-9][0-9][,.][^0-9]|^[1-9][0-9][,.][^0-9]|[1-9][0-9][,.]$|[^,.0-9][1-9][0-9][^,.0-9]|^[1-9][0-9][^,.0-9]|[^,.0-9][1-9][0-9]$|^[1-9][0-9]$/p}' file
