dotfiles
======

Setup
------

One-liner to download and execute:

```
bash <(curl -s https://raw.githubusercontent.com/boombador/dotfiles/master/setup.sh)
```

Download the latest setup script with `curl` and peruse the file at your leisure
for anything disagreeable, then run the script once you're satisfied.

```
curl https://raw.githubusercontent.com/boombador/dotfiles/master/setup.sh -O
bash setup.sh
```

Note: The script assumes you want to download most of your code repositories:
in a directory called `$HOME/Code`. You currently have to edit the `setup.sh`
and `bash.sh` manually.
