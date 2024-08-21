package main

import "C"

//export DifySeccomp
func DifySeccomp(uid int, gid int, enable_network bool) {
	//python.InitSeccomp(uid, gid, enable_network)
}

func main() {}
