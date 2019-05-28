
# Crontab

## Commands

| Commands     |                                                               |
| ------------ |:-------------------------------------------------------------:|
| `crontab -e` | Edit crontab file, or create one if it doesn’t already exist. |
| `crontab -l` | crontab list of cronjobs , display crontab file contents.     |
| `crontab -r` | Remove your crontab file.                                     |
| `crontab -v` | Display the last time you edited your crontab file.           |

To specify a editor to open crontab file:
```
export EDITOR=vi
```

## Environment

`cron` invokes the command from the user’s HOME directory with the shell, (/usr/bin/sh).

`cron` supplies a default environment for every shell, defining:

    HOME=user’s-home-directory
    LOGNAME=user’s-login-id
    PATH=/usr/bin:/usr/sbin:.
    SHELL=/usr/bin/sh

Users who desire to have their .profile executed must explicitly do so in the crontab entry or in a script called by the entry.


## Disable Email

By default cron jobs sends a email to the user account executing the cronjob. If this is not needed put the following command At the end of the cron job line:

	>/dev/null 2>&1

## Generate log file

To collect the cron execution execution log in a file :

	30 18 * * * rm /home/someuser/tmp/* > /home/someuser/cronlogs/clean_tmp_dir.log

## Crontab file location

User crontab files are stored by the login names in different locations in different Unix and Linux flavors. These files are useful for backing up, viewing and restoring but should be edited only with crontab command by the users.

- Mac OS X => `/usr/lib/cron/tabs/`
- BSD Unix => `/var/cron/tabs/`
- Solaris, HP-UX, Debian, Ubuntu => `/var/spool/cron/crontabs/`
- AIX, Red Hat Linux, CentOS, Ferdora => `/var/spool/cron/`

## Python

- See: [cron and click](https://click.palletsprojects.com/en/7.x/python3/)

### Python 3 Surrogate Handling

Click in Python 3 does all the Unicode handling in the standard library and is subject to its behavior. In Python 2, Click does all the Unicode handling itself, which means there are differences in error behavior.

The most glaring difference is that in Python 2, Unicode will “just work”, while in Python 3, it requires extra care. The reason for this is that in Python 3, the encoding detection is done in the interpreter, and on Linux and certain other operating systems, its encoding handling is problematic.

The biggest source of frustration is that Click scripts invoked by init systems (sysvinit, upstart, systemd, etc.), deployment tools (salt, puppet), or cron jobs (cron) will refuse to work unless a Unicode locale is exported.

If Click encounters such an environment it will prevent further execution to force you to set a locale. This is done because Click cannot know about the state of the system once it’s invoked and restore the values before Python’s Unicode handling kicked in.

If you see something like this error in Python 3:

```
Traceback (most recent call last):
  ...
RuntimeError: Click will abort further execution because Python 3 was
  configured to use ASCII as encoding for the environment. Either switch
  to Python 2 or consult http://click.pocoo.org/python3/ for
  mitigation steps.
```

You are dealing with an environment where Python 3 thinks you are restricted to ASCII data. The solution to these problems is different depending on which locale your computer is running in.

For instance, if you have a German Linux machine, you can fix the problem by exporting the locale to de_DE.utf-8:

	export LC_ALL=de_DE.utf-8
	export LANG=de_DE.utf-8

If you are on a US machine, en_US.utf-8 is the encoding of choice. On some newer Linux systems, you could also try C.UTF-8 as the locale:

	export LC_ALL=C.UTF-8
	export LANG=C.UTF-8

### Python and errors

When an error occurs, Python redirect the message in STDERR.
So you have to redirect STDERR to STDOUT.

    - STDIN = 0
    - STDOUT = 1
    - STDERR = 2

So to redirect: 2>&1

## Useful links

- [crontab guru](https://crontab.guru)
