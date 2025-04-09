---
date: 2025-04-10
tags: [ bash, wsl, auto-completion ]
---

# Autocompletion

Bash autocompletion is provided by an extra software tool `bash-completion`.

This tool can pickup command names and triggers corresponding scripts on completion request.

These scripts usually have the form of: 

```bash
__helper_function() 
{
       # Completion logic here 
}
 
complete -F __helper_function command
```

So, the command to complete must match the specified name exactly.
This trips me up occasionally, as I call programs installed on windows-side with `command.exe` and they dont get picked up.
Easy fix is to alias the commands to a version without `.exe`, e.g. `alias command.exe=command`.

## Additional tooling
[carapace.sh](https://carapace.sh/) 
