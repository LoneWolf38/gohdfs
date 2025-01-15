HADOOP_COMMON_PROTOS = $(shell find internal/protocol/hadoop_common -name '*.proto')
HADOOP_HDFS_PROTOS = $(shell find internal/protocol/hadoop_hdfs -name '*.proto')
GENERATED_PROTOS = $(shell echo "$(HADOOP_HDFS_PROTOS) $(HADOOP_COMMON_PROTOS)" | sed 's/\.proto/\.pb\.go/g')
SOURCES = $(shell find . -name '*.go') $(GENERATED_PROTOS)

# Protobuf needs one of these for every 'import "foo.proto"' in .protoc files.
PROTO_MAPPING = MSecurity.proto=github.com/LoneWolf38/gohdfs/internal/protocol/hadoop_common

all: hdfs

%.pb.go: $(HADOOP_HDFS_PROTOS) $(HADOOP_COMMON_PROTOS)
	echo $(HADOOP_COMMON_PROTOS)
	protoc --go_out=internal/protocol/hadoop_common --go_opt=paths=source_relative -Iinternal/protocol/hadoop_common -Iinternal/protocol/hadoop_hdfs $(HADOOP_COMMON_PROTOS)
	protoc --go_out=internal/protocol/hadoop_hdfs --go_opt=paths=source_relative -Iinternal/protocol/hadoop_common -Iinternal/protocol/hadoop_hdfs $(HADOOP_HDFS_PROTOS)

clean-protos:
	find . -name *.pb.go | xargs rm

hdfs: clean $(SOURCES)

test: hdfs
	go test -v -race -timeout 30s ./...

.PHONY: clean clean-protos install test release
