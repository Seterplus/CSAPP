### 一些闲话
- csapp.c内的open_clientfd用了gethostbyname函数，所以不是线程安全的，这里将其改为了getaddrinfo版本。
- PKU的driver本身存在一定的问题(?)，所以这个proxy的cache是非常naive的。若要获得一个可以正常使用（不带cache）的proxy，可将Makefile中的-DPROXY_CACHE删去。若要学习cache的正确姿势，请阅读HTTP/1.1的文档关于Cache-Control的部分。
- 好吧我承认上句话是在为自己偷懒找借口。但是在实际应用中，proxy cache的hit率是很低的，所以cache还是交给浏览器去做为好。
- 有一些细节没有处理好，主要是错误处理，比如getaddrinfo失败时会输出Success。但这些DEBUG信息不会影响正常使用。另一点是write的时候其实也要select防止无法写入引起的阻塞。
- 正常使用指的是HTTP/HTTPS。这个proxy没有处理FTP等其他协议。
- Rio包缺点大于优点。它的鲁棒性用人话来说就是“我说读一行就读满一行否则就阻塞”“我说读n个字符就读n个字符否则就阻塞”，但在实际使用中没有那么理想。另一点是用rio_readlineb读二进制文件有可能出现奇怪的错误。
- 这个proxy对每个请求开一个线程跑。这样做的优点是减少代码量以及一个请求即使暂时阻塞也不会影响到其他请求，而且扩展性和可维护性强，之后处理长连接也方便。缺点是无法做大并发代理。
- 要做大并发代理可以参考书上的读者-写者问题，事先开一定数量的线程并将每个连接分配到一个线程上，即一个线程对多个连接，然后在线程内跑epoll。
- 下面附上driver使用方式。

### Driver
- **编译**：在proxylab-handout目录下执行以下语句
``` bash
make; cd tiny; make; cd ..
```
- **整体测试**：在testdriver目录下执行以下语句
``` bash
./driver.py
```
- **单个part测试**：在testdriver目录下执行以下语句
``` bash
./test-driver.pl -t <part> -p <port>
```
其中*<part>*为测试part编号（1/2/3），*<port>*为proxy运行的端口号。
- **制作提交文件**：请确认你的所有文件都在proxylab-handout目录下，且在此目录make可以生成可执行文件proxy。在proxylab-handout目录下执行以下语句
``` bash
make submit
```
即可在proxylab-handout所在目录生成提交文件proxylab.tar。
