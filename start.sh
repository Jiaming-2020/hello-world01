echo "拉取代码"
git pull

echo "安装依赖和打包"
npm install --registry=https://registry.npm.taobao.org/ && npm run build

echo "删除容器"
docker rm -f demo1 &> /dev/null

echo "启动容器"
docker run -d --restart=on-failure:5\
    -p 12365:80 \
    -v $PWD/dist:/usr/share/nginx/html \
    --name demo1 nginx