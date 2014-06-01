divert(-1)
Copyright (c) 2014 Raphael Robatsch <raphael@tapesoftware.net>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

define(`literal', `divert(0)`$1'divert(-1)')
define(`tput', `$(`tput' `$1')')
define(`style', `literal(\[) literal(patsubst(`$@', `,', `')) literal(\])')
define(`styled', `style(shift($@)) literal(`$1')')

define(`define_color', `
    define(`$1', `tput(setaf $2)')
    define(`bg_$1', `tput(setab $2)')
')

define(`reset', `tput(sgr0)')
define(`bold', `tput(`bold')')
define(`rev', `tput(`rev')')
define_color(`red', 1)
define_color(`green', 2)
define_color(`brown', 3)
define_color(`blue', 4)
define_color(`magenta', 5)
define_color(`cyan', 6)
define_color(`white', 7)

Example below:
Results in '[username@hostname workingdir]$ ', colorized.
Have fun.

styled(`[', reset)
styled(`\u', red)
styled(`@', reset)
styled(`\h', cyan)
styled(` ', reset)
styled(`\W', white, bold)
styled(`]\$ ', reset)
divert
