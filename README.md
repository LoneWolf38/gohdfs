<img src="docs/gopher.png" alt="gopher" align="right" width="200"/>

HDFS Native Client for Go

[![GoDoc](https://godoc.org/github.com/LoneWolf38/gohdfs/web?status.svg)](https://godoc.org/github.com/LoneWolf38/gohdfs) 

This is a native golang client for hdfs. It connects directly to the namenode using
the protocol buffers API.

It tries to be idiomatic by aping the stdlib `os` package, where possible, and
implements the interfaces from it, including `os.FileInfo` and `os.PathError`.

Here's what it looks like in action:

```go
client, _ := hdfs.New("namenode:8020")

file, _ := client.Open("/mobydick.txt")

buf := make([]byte, 59)
file.ReadAt(buf, 48847)

fmt.Println(string(buf))
// => Abominable are the tumblers into which he pours his poison.
```

For complete documentation, check out the [Godoc][1].

Compatibility
-------------

This library uses "Version 9" of the HDFS protocol, which means it should work
with hadoop distributions based on 2.2.x and above, as well as 3.x.

Acknowledgements
----------------

This library is heavily indebted to [colinmarc][3]. This is actually a fork of the project made by [colinmarc][5]. As the previous repo was not being maintained and I wanted some more functionalities to be added to the library, that's why I have created this repo.

[1]: https://godoc.org/github.com/LoneWolf38/gohdfs
[2]: https://golang.org/doc/install
[3]: https://github.com/spotify/snakebite
[4]: https://github.com/colinmarc/hdfs
[5]: https://github.com/colinmarc
