# Info

_TODO_

# BUILD

```
docker build -t temp_openwrt_build .
```

```
docker run --rm --name openwrt_build -v ./deps:/deps -v ./build:/build temp_openwrt_build
```

```
docker exec -it openwrt_build /bin/bash
...
docker stop openwrt_build
```

Build:

```bash
chmod +x /deps/build.sh
/deps/build.sh
```
