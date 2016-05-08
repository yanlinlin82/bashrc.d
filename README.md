# bashrc.d

My useful bash functions for `.bashrc`

## Usage

Add following lines to `~/.bashrc`:

    for sh in /path/to/bashrc.d/*.sh ; do
        [ -r "$sh" ] && . "$sh"
    done
    unset sh
