
#!/usr/bin/bash

echo "part 1"
awk -f day7.1.awk day7.input

echo "part 2"
awk -f day7.2.awk sample
awk -f day7.2.awk day7.input
