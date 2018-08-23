# INSTALL

This page contains the information about the needed prerequistes to be installed for [contributing on the IKATS Website](CONTRIBUTING.website.md).


## Git and Ruby

To be able to edit the web site, you shall have the following tools installed on your computer :

- [git](https://git-scm.com/): the source code management system
- [ruby](https://www.ruby-lang.org/fr/): a code interpreter used to run Jekyll

### For Ubuntu/Debian users do the following :

```bash
# Install Git
sudo apt-get install git git-core

# Remove older ruby (badly installed by ubuntu)
sudo apt remove ruby

# Install Ruby
cd
sudo apt-get update

sudo apt-get install curl zlib1g-dev build-essential software-properties-common libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev


git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.5.1
rbenv global 2.5.1
ruby -v
```

### For windows users

Please use :

- [TortoiseGit](https://tortoisegit.org/)
- [Ruby installer](https://rubyinstaller.org/downloads/)

_Note:_ The ruby installer installs ruby in a specific context. You won't be able to use ruby directly from the standard console.

## Jekyll

[Jekyll](https://jekyllrb.com/) is a static website manager

On Ubuntu/Debian:

```bash
# Install Jekyll
sudo apt-get install ruby2.5-dev ruby ruby-all-dev jekyll
gem install jekyll bundler
```

### For windows users

- Follow [this documentation](https://jekyllrb.com/docs/windows/#installation-via-rubyinstaller) about how to install jekyll on windows
- In a **ruby** console, please enter :

  ```batch
  # Set the proxy if required
  SET HTTP_PROXY=proxy_url:3128

  # Install
  gem install jekyll bundler
  ```

## Atom (text editor)

[Atom](https://atom.io) is the recommended text/page editor.
This editor use package for additionnal features like syntax coloring, git controls, ...

After installing it (through [official website](https://atom.io)), open `atom` and install the following packages:

- `language-liquid`: syntax highlight for {{%}} like tags
- `jekyll`: build and live-reload
- `jekyll-syntax-highlighting`: various syntax highlight for jekyll parts
- `language-markdown`: Markdown syntax highlight
- `context-git`: Git commands
  - A warning could appear «Disable GitHub Package». Check the advice and disable GitHub if you do not use it.

### For windows users

Atom installer for windows doesn't require administrator rights.
To be able to use Atom with `Jekyll` commands, follow the path:

- Go to `packages`>`Settings view`>`Open` (or press `ctrl+,` then select `packages`)
- Find `Jekyll` packages and click on `settings`
- Change the default _build command_ to `C:\Ruby24-x64\bin\jekyll.bat, serve` (adapt to your install path)

## Get the IKATS Website locally

IKATS website is managed by git. Repository address is `https://github.com/IKATS/ikats.github.io`.

You need to have the credentials to read and write on this repository.

In a terminal, do the following

```bash
git clone https://github.com/IKATS/ikats.github.io

# Then provide your git credentials when required

```

The `ikats_website` folder will be created at the current location and contain the latest `master` branch from repository.

Inside `ikats_website` folder, on Debian/Ubuntu open a terminal to install depedencies :

```bash
bundle install
```

### For windows users

- Open a ruby console (not a standard console, it won't work), then go to the `ikats_website` folder and enter:

  ```batch
  # Set the proxy if required
  SET HTTP_PROXY=proxy_url:3128

  # Install dependencies
  bundle install
  ```

**For windows users:** Configure your TortoiseGit in the following way to make the change permanent :

- Open the TortoiseGit settings
- Select the Git configuration
- Open the global git configuration pressing "Edit global gitconfig"
- Write the contents above into the configuration.


# You could now make changes
Now that all prerequisites are installed, you could make changes to the website. Follow the instructions detailed into the document [CONTRIBUTING.md](CONTRIBUTING.website.md)
