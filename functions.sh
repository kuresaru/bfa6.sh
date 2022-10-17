followings() {
    curl -$IPV -sk "https://api.bilibili.com/x/relation/followings?vmid=$MID&pn=$PN&ps=20&order=desc&order_type=attention&jsonp=jsonp&callback=__jp5" \
        -H 'authority: api.bilibili.com' \
        -H 'pragma: no-cache' \
        -H 'cache-control: no-cache' \
        -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36' \
        -H 'accept: */*' \
        -H 'sec-fetch-site: same-site' \
        -H 'sec-fetch-mode: no-cors' \
        -H 'sec-fetch-dest: script' \
        -H "referer: https://space.bilibili.com/$MID/fans/follow" \
        -H 'accept-language: zh-CN,zh;q=0.9' \
        -H "cookie: SESSDATA=$SD;" \
        -H 'dnt: 1' \
        -H 'sec-gpc: 1' \
        --compressed | sed -r 's/(^__jp5\()|(\)$)//g'
}

mymid() {
    curl -$IPV -isk 'https://space.bilibili.com/' \
        -H 'authority: space.bilibili.com' \
        -H 'pragma: no-cache' \
        -H 'cache-control: no-cache' \
        -H 'upgrade-insecure-requests: 1' \
        -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36' \
        -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
        -H 'sec-fetch-site: none' \
        -H 'sec-fetch-mode: navigate' \
        -H 'sec-fetch-user: ?1' \
        -H 'sec-fetch-dest: document' \
        -H 'accept-language: zh-CN,zh;q=0.9' \
        -H "cookie: SESSDATA=$SD;" \
        -H 'dnt: 1' \
        -H 'sec-gpc: 1' \
        --compressed | grep -i ^location: | grep -Po '(?<=space\.bilibili\.com/)[0-9]+'
}
