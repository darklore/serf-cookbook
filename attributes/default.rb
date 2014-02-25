
default[:serf][:version] = '0.4.1'
default[:serf][:arch] = node[:kernel][:machine] == "x86_64" ? "amd64" : "386"
