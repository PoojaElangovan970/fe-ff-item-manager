FROM mtu-docker-image-virtual.prod.mtjfrog.mt.mtnet/build/nginx:alpine

ARG ARTIFACT_PATH

RUN addgroup -g 1001 appgroup && adduser -u 1001 -G appgroup -S freshx
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY dist/fe-ff-item-manager /usr/share/nginx/html/microfrontend/item-manager
RUN mkdir -p /var/cache/nginx/client_temp \
    && chown -R 1001:1001 /var/cache/nginx \
    && chmod -R 755 /var/cache/nginx \
    && chown -R 1001:1001 /var/run \
    && chown -R 1001:1001 /run \
    && sed -i 's|pid /run/nginx.pid;|pid /tmp/nginx.pid;|g' /etc/nginx/nginx.conf
 
USER 1001