FROM land007/node:latest

MAINTAINER Jia Yiqiu <yiqiujia@hotmail.com>

#ulink /root/.nvm/versions/node/v10.20.0/lib/node_modules
RUN rm -rf /node_/node_modules && ln -s /node_modules /node_/node_modules

ADD . /node_/
RUN sed -i 's/*/./g' /check.sh
#RUN echo "#基础路径\n\
#BASE_URL='./'\n\
##开发环境代理服务地址\n\
#PROXY_SERVER='http://localhost:3000'" > /node_/.env
RUN . $HOME/.nvm/nvm.sh && cd /node_/ && npm install
ENV password=fcea920f7412b5da7be0cf42b8c93759

RUN sed -i 's/\r$//' /*.sh ; chmod +x /*.sh && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/webchat" >> /.image_names && \
	echo "land007/webchat" > /.image_name

RUN echo 'cd /node/ && nohup npm run serve > /tmp/serve.out 2>&1 &' >> /task.sh && \
	echo 'cd /node/ && nohup npm run prod > /tmp/prod.out 2>&1 &' >> /task.sh
#VOLUME ["/data"]
EXPOSE 8080

#	echo 'node /node/src-gen/backend/main.js /home/project --hostname=0.0.0.0 --startup-timeout=-1 --inspect=0.0.0.0:9229' >> /start.sh

#docker build -t "land007/webchat:latest" .
#> docker buildx build --platform linux/amd64,linux/arm64/v8,linux/arm/v7 -t land007/webchat --push .
#docker rm -f webchat; docker run -it --rm -p 18080:8080 --name webchat land007/webchat:latest
