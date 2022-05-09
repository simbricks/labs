import simbricks.experiments as exp
import simbricks.simulators as sim
import simbricks.nodeconfig as node

e = exp.Experiment('lab1_test2')

net = sim.SwitchNet()
e.add_network(net)


server = sim.QemuHost()
server.name = 'server'

server_config = node.I40eLinuxNode()
server.set_config(server_config)
server_config.prefix = 24
server_config.ip = '10.0.0.1'

server_config.app = node.IperfTCPServer()

server_nic = sim.I40eNIC()
server_nic.set_network(net)
server.add_nic(server_nic)

e.add_nic(server_nic)
e.add_host(server)


# Create host simulator for client
client = sim.QemuHost()
client.name = 'client'
client.wait = True # Wait for client to shut down before ending experiment

# Node configuration describes software configuration running on the client
client_config = node.I40eLinuxNode()
client_config.prefix = 24
client_config.ip = '10.0.0.2'

client_config.app = node.IperfTCPClient()
client_config.app.server_ip = '10.0.0.1' # Client needs to know server IP
client.set_config(client_config)

# Create nic simulator for client
client_nic = sim.I40eNIC()
client_nic.set_network(net)
client.add_nic(client_nic)

e.add_nic(client_nic)
e.add_host(client)

experiments = [e]