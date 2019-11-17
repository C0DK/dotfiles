#!/bin/bash
go get -u github.com/mdempsky/gocode
go get -u golang.org/x/tools/cmd/guru
go build golang.org/x/tools/cmd/guru
go get -u github.com/godoctor/godoctor
go install github.com/godoctor/godoctor
go get -u golang.org/x/lint/golint
go get -u github.com/kisielk/errcheck
go get -u github.com/mdempsky/unconvert
go get -u honnef.co/go/tools/cmd/staticcheck
