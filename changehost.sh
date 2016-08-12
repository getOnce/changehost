#!/bin/bash
echo "输入需要修改的host. [231、205、207、自定义ip]"
#需要改变的host
allhost=(
'www.qyer.com'
'place.qyer.com'
)
#默认不变的host
defaulthost=(
'127.0.0.1 nihao.com'
)
read myhost
case ${myhost} in
        231) myhost='172.1.1.231'
        ;;
        205) myhost='115.182.69.215'
        ;;
        207) myhost='online'
        ;;
        1 | 2) myhost='172.16.34.205'
        ;;
esac
echo "当前的host是:$myhost"
echo -n '' > "/etc/hosts"
if [ "$myhost" != "online" ]; then
        for loop in ${allhost[*]}
        do
                echo "${myhost}  ${loop}" >> "/etc/hosts"
        done
fi
for ((i=0;i<${#defaulthost[*]};i++))
do
        echo "${defaulthost[i]}" >> "/etc/hosts"
done

