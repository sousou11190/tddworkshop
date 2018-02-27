# coding: utf-8
class SemVersion

  attr_reader :major, :minor, :patch

  def initialize(major=0, minor=0, patch=0)
    @major = major
    @minor = minor
    @patch = patch
    
    if major < 0 then
      raise IllegalMajorFormatException.new("majorは正の整数または0である必要があります。")
    end
    if minor < 0 then
      raise IllegalMinorFormatException.new("minorは正の整数または0である必要があります。")
    end
    if patch < 0 then
      raise IllegalPatchFormatException.new("patchは正の整数または0である必要があります。")
    end
    
  end

  def to_s()
    return "#{major}.#{minor}.#{patch}"
  end

  def patch_version_up()
    @patch = @patch + 1
  end

  def minor_version_up()
    @minor = @minor + 1
    @patch = 0
  end

  def major_version_up()
    @major = @major + 1
    @minor = 0
    @patch = 0
  end

  def compare(version)
    if @major == version.major and @minor == version.minor and @patch == version.patch then
      return 0
    end    

  end

  
end
