FROM golang:1.9 as BUILDER

WORKDIR /usr/src/app

COPY ./src /usr/src/app/

RUN go build -o hello .


FROM scratch

COPY --from=BUILDER /usr/src/app/hello .

CMD [ "./hello" ]
