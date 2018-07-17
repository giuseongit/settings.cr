require "./settings/*"

# TODO: Write documentation for `Settings`
module Settings
  class SettingManager
    @cfg : Settings
    getter cfg

    def initialize(path : String, @cfgClass : Settings.class)
        @path = File.expand_path path
        dirname = File.dirname @path
        unless Dir.exists? dirname
            Dir.mkdir_p dirname
        end
        @cfg = @cfgClass.new # just to keep the compiler happy
        if File.exists? @path
            load
        else
            # create file with default values
            save
        end
    end

    def load
        @cfg = @cfgClass.from_s File.read(@path)
        @cfg
    end

    def save
        File.write @path, @cfg.to_s
    end

    forward_missing_to @cfg
  end
end
