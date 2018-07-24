require "../src/settings"
include Settings

# =============================
# Settings manager classes
# =============================
class TestMgr1 < SettingsManager
  def initialize
    super(TEST_CFG_PATH, Test1)
  end
end

class TestMgr2 < SettingsManager
  def initialize
    super(TEST_CFG_PATH, Test2)
  end
end

class TestMgr3 < SettingsManager
  def initialize
    super(TEST_CFG_PATH, Test3)
  end
end
