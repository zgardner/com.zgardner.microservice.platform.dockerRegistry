docker rm $(docker stop $(docker ps -a | grep 'registry:2.4.1' | awk '{print $1;}')) && 0
docker run -d -p 5000:5000 \
           -v /var/work/dockerRegistry/:/var/lib/registry \
           -v /home/dorisjenkinsslave/dockerRegistry/auth:/auth \
           -e REGISTRY_AUTH=htpasswd \
           -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
           -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
           registry:2.4.1
