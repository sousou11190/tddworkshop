# coding: utf-8
require 'test/unit'
require "./sem_version"
require "./sem_version_exception"

class SemVersionTest < Test::Unit::TestCase
  
  sub_test_case "バージョンオブジェクトはmajor, minor, patch の3つによって表され、初期値は全て0である" do

    def setup
      super
      # 前準備
      @sem_version = SemVersion.new()
    end
    
    def test_SemVersionオブジェクトのmajorフィールドの初期値はゼロである()
      # 実行＆検証      
      assert_equal(0, @sem_version.major)
    end
    def test_SemVersionオブジェクトのminorフィールドの初期値はゼロである()
      # 実行＆検証
      assert_equal(0, @sem_version.minor)
    end
    def test_SemVersionオブジェクトのpatchフィールドの初期値はゼロである()
      # 実行＆検証
      assert_equal(0, @sem_version.patch)
    end

    def test_printメソッドを呼び出すとmajor．minor．patchの文字列を返す()
      # 実行＆検証
      assert_equal("0.0.0", @sem_version.to_s())
    end
  end
  
  sub_test_case "バージョンオブジェクトはmajor, minor, patch の3つによって表され、set_versionメソッドで値を設定できる" do
    
    @BeforeEach
    def setup
      super
      # 前準備
      @sem_version = SemVersion.new(major=2, minor=3, patch=4)
      #@sem_version.set_version(major=2, minor=3, patch=4)
    end
    
    def test_SemVersionオブジェクトのmajorフィールドを3つの引数で指定できる()
      # 実行＆検証
      assert_equal(2, @sem_version.major)
    end

    def test_SemVersionオブジェクトのminorフィールドを3つの引数で指定できる()
      # 実行＆検証
      assert_equal(3, @sem_version.minor)
    end
    
    def test_SemVersionオブジェクトのpatchフィールドを3つの引数で指定できる()
      # 実行＆検証
      assert_equal(4, @sem_version.patch)
    end    
  end

  sub_test_case "バージョンの各フィールドはゼロ、または正の整数以外は使えない。" do
    
    def setup
      super
      # 前準備
      @sem_version = SemVersion.new()
    end

    def test_majorフィールドが正の整数でない場合、IllegalMajorFormatExceptionが発生
      # 実行＆検証
      assert_raise(IllegalMajorFormatException){ SemVersion.new(major=-2, minor=3, patch=4) }
    end
    
    def test_minorフィールドが正の整数でない場合、IllegalMinorFormatExceptionが発生
      # 実行＆検証
      assert_raise(IllegalMinorFormatException){ SemVersion.new(major=2, minor=-3, patch=4) }
    end

    def test_patchフィールドが正の整数でない場合、IllegalPatchFormatExceptionが発生
      # 実行＆検証
      assert_raise(IllegalPatchFormatException){ SemVersion.new(major=2, minor=3, patch=-4) }
    end
    
  end

  sub_test_case "バージョンオブジェクトはバージョンアップできる" do
    
    def test_patch_version_upを呼ぶとバージョンオブジェクトはパッチバージョンアップできる
      # 前準備
      @sem_version = SemVersion.new()
      # 実行
      @sem_version.patch_version_up()
      # 検証
      assert_equal("0.0.1", @sem_version.to_s)
    end

    def test_minor_version_upを呼ぶとminorがインクリメントされ、patchが0リセットされる
      # 前準備
      @sem_version = SemVersion.new(major=2, minor=3, patch=2)
      # 実行
      @sem_version.minor_version_up()
      # 検証
      assert_equal("2.4.0", @sem_version.to_s)
    end

    def test_major_version_upを呼ぶとmajorがインクリメントされ、minorとpatchが0リセットされる
      # 前準備
      @sem_version = SemVersion.new(major=2, minor=3, patch=2)
      # 実行
      @sem_version.major_version_up()
      # 検証
      assert_equal("3.0.0", @sem_version.to_s)
    end
    
  end

  sub_test_case "バージョンオブジェクトは比較演算できる" do

    def setup
      @sem_version1 = SemVersion.new(major=5, minor=2, patch=4)
      @sem_version2 = SemVersion.new(major=5, minor=2, patch=4)
    end

    def test_majorとminorとpatchが等しい場合、compareメソッドが0を返す
      assert_equal(0, @sem_version1.compare(@sem_version2))
    end
    
  end

end
