FROM alpine as builder
RUN apk --no-cache add subversion
RUN svn checkout --depth empty svn://svn.tuxfamily.org/svnroot/tesseract/main
RUN svn update --set-depth infinity main/src
WORKDIR /main/src/
RUN apk --no-cache add make gcc libc-dev g++ zlib-dev
RUN make server
CMD [ "./tess_server" ]

