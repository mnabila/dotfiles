require("sshfs"):setup({
	mount_dir = "/tmp/sshfs",
	sshfs_options = {
		"reconnect",
		"compression=no",
		"cache_timeout=300",
		"ConnectTimeout=10",
		"dir_cache=yes",
		"dcache_timeout=600",
	},
})
