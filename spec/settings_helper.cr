require "../src/settings"
include Settings

# =============================
# Settings test classes
# =============================
class Test1 < SettingsClass
  property token : String? = nil
end

class Test2 < SettingsClass
  property token : String = "default"
end

class Test3 < SettingsClass
  property token : String? = nil
  property age : Int32 = 0
end
