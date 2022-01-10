[Stylelint](https://stylelint.io) does not provide an error code for their warnings.
Instead, it shows a string, which can be attached to [https://stylelint.io/user-guide/rules/list/](https://stylelint.io/user-guide/rules/list/) for additional explanation.

Example:

```bash
	base_url = "https://stylelint.io/user-guide/rules/list/"
	error_name = "font-family-name-quotes"

	$BROWSER "$base_url$error_name"
	# firefox https://stylelint.io/user-guide/rules/list/font-family-name-quotes/
```
