module Settings
  class SettingsClass
    def to_s
      cfg_str = ""
      {% begin %}
        {% for var in @type.instance_vars %}
          cfg_str += @{{var}}.nil? ? "" : "{{var}}=#{@{{var}}}\n"
        {% end %}
      {% end %}
    end

    def SettingsClass.from_s(string) : SettingsClass
      constructor_args = {} of String => String

      lines = string.split '\n'
      lines.each do |line|
        if line != "" && line.at(0) != '#' # skip commented and empty lines
          key, val = line.split '='
          constructor_args[key] = val
        end
      end

      {% begin %}
        obj = {{@type}}.new
        {% for var in @type.instance_vars %}
          obj.{{var}} = constructor_args["{{var}}"] if constructor_args.has_key? "{{var}}"
        {% end %}
        obj
      {% end %}
    end

    # It's necessary to implement this hook because the access to the config's field are not here
    macro method_missing(call)
  end
  end
end
