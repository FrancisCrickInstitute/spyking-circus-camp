import sys
import re

host_text = sys.argv[1]
core_count = sys.argv[2]
print("Hosts: " + host_text)

# Split and parse the host information from CAMP
hosts = list()
splitz = host_text.split("[")
if len(splitz) != 2:
    hosts.append(host_text)

else:
    prefix = splitz[0]
    to_parse = splitz[1]

    # Progressive parsing
    complete = False
    while not complete:
        node_number = re.search(r'\d+', to_parse).group()
        to_parse = to_parse.replace(node_number, "", 1)

        # Check for additional directives to expand
        directive = to_parse[0]
        to_parse = to_parse.replace(directive, "", 1)

        # Handle bounded
        if directive == "-":
            lower_bound = node_number
            to_parse = to_parse.replace("-", "", 1)
            upper_bound = re.search(r'\d+', to_parse).group()
            to_parse = to_parse.replace(upper_bound, "", 1)
            for i in range(int(lower_bound), int(upper_bound) + 1):
                hosts.append(prefix + str(i))
        elif directive == ",":
            hosts.append(prefix + node_number)
            continue
        else:
            hosts.append(prefix + node_number)
            complete = True

print("Parsed hosts: " + str(hosts))

# Write to file
with open("mpi.hosts", "w") as f:
    for host in hosts:
        f.write(host + ":" + core_count + "\n")

