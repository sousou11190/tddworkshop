# coding: utf-8
class SemVersionException < StandardError
  # 特にオーバーライドする内容は無し
end

class IllegalMajorFormatException < SemVersionException
  # 特にオーバーライドする内容は無し
end

class IllegalMinorFormatException < SemVersionException
  # 特にオーバーライドする内容は無し
end

class IllegalPatchFormatException < SemVersionException
  # 特にオーバーライドする内容は無し
end
