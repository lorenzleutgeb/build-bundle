include "schedule";

def set_output(name; value): "::set-output name=\(name)::\(value | tostring)";

(trigger[] | select(.tag == $tag) | to_entries | map(set_output(.key; .value)) + [set_output("trigger"; true)]) | join("\n")
