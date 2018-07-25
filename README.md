# settings.cr [![Build Status](https://travis-ci.org/giuseongit/settings.cr.svg?branch=master)](https://travis-ci.org/giuseongit/settings.cr) [![GitHub release](https://img.shields.io/github/release/giuseongit/settings.cr.svg)](https://github.com/giuseongit/settings.cr/releases)

A simple tool to serialize/deserialize configuration objects ino a key=value text file which is
easily editable

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  settings:
    github: giuseongit/settings
```

## Usage

Settings consists of two parts: the actual serialized settings file and the manager.
The settings class must extend `Settings::SettingsClass`.
The only thing that needs to be done is list the fields to be serialized

```crystal
require "settings"

class MySettings < Settings::SettingsClass
  property token : String? = nil
end
```
or, including the module
```crystal
require "settings"
include Settings

class MySettings < SettingsClass
  property token : String? = nil
end
```
Then a manager needs to be defined, specifying the class to serialize and the path
of the file to be written:

```crystal
require "settings"
class MyManager < Settings::SettingsManager
  def initialize
    super("~/.custom_settings", MySettings)
  end
end
```
From now on you can use only the manager object to save/load data to/from file
and to access the settings' fileds:
```crystal
mrg = MyManager.new
mgr.token = "AAAA"
mrg.save # Saves the settings object to file
```
The produced file will have a simple key=value, easily modifiable structure:
```
token=AAAA
```
which you can edit with the text editor of your choice.
When a manager is created it creates the file with default values if it doesn't exists,
otherwise it'll load the contents of the file via the `load` method (which you can call directly)
```crystal
mrg = MyManager.new # create file (if not present)
# edit the file with an external editor
mgr.load # loads the new contents from file

```


## Contributing

1. Fork it (<https://github.com/giuseongit/settings/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [giuseongit](https://github.com/giuseongit) Giuseppe Pagano - creator, maintainer
