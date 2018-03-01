# coding: utf-8
require 'test/unit'
require "./fizzbuzz"

class FizzBuzzTest < Test::Unit::TestCase

  def setup
    super
    # 前準備
    @fizzbuzz = FizzBuzz.new()
  end

  sub_test_case "その他の数の場合は文字列にして返す" do
    def test_1を渡すと文字列1を返す
      # 実行 & 検証
      assert_equal("1", @fizzbuzz.convert(1))
    end
    
    def test_2を渡すと文字列2を返す
      # 実行 & 検証
      assert_equal("2", @fizzbuzz.convert(2))
    end    
  end
  
  sub_test_case "3の倍数のときは数の代わりにFizzと返す" do
    def test_3を渡すと文字列Fizzを返す
      assert_equal("Fizz", @fizzbuzz.convert(3))
    end
    def test_6を渡すと文字列Fizzを返す
      assert_equal("Fizz", @fizzbuzz.convert(6))
    end
  end

  sub_test_case "5の倍数のときは数の代わりにBuzzと返す" do
    def test_5を渡すと文字列Buzzを返す
      assert_equal("Buzz", @fizzbuzz.convert(5))
    end
    def test_10を渡すと文字列Buzzを返す
      assert_equal("Buzz", @fizzbuzz.convert(10))
    end  
  end
  
  sub_test_case "15の倍数の場合は数の代わりにFizzBuzzと返す" do
    def test_15を渡すと文字列FizzBuzzを返す
      assert_equal("FizzBuzz", @fizzbuzz.convert(15))
    end
    def test_30を渡すと文字列FizzBuzzを返す
      assert_equal("FizzBuzz", @fizzbuzz.convert(30))
    end
  end


end
