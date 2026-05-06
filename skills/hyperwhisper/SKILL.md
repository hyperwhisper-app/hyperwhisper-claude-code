---
name: hyperwhisper
description: Toggle HyperWhisper agent integration on or off for this project
args: on|off or empty to toggle
---

Run this bash command exactly:

```bash
ARG="$ARGUMENTS" python3 - <<'PY'
import os
from pathlib import Path
h = 1469598103934665603
for b in os.getcwd().encode():
    h ^= b
    h = (h * 1099511628211) & 0xffffffffffffffff
root = Path("/tmp/hyperwhisper-agent")
root.mkdir(parents=True, exist_ok=True)
flag = root / f"disabled-{h:016x}"
arg = os.environ.get("ARG", "")
if arg == "on":
    flag.unlink(missing_ok=True)
    print("HyperWhisper: ON")
elif arg == "off":
    flag.write_text("")
    print("HyperWhisper: OFF")
elif flag.exists():
    flag.unlink()
    print("HyperWhisper: ON")
else:
    flag.write_text("")
    print("HyperWhisper: OFF")
PY
```

Report the single-line output to the user. Nothing else.
