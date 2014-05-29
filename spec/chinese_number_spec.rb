$VERBOSE = true
require 'minitest/autorun'
require 'minitest/spec'

require_relative '../lib/chinese_numerals.rb'

describe Integer do
  it "maps each digit" do
    10000.to_chinese.must_equal("一零零零零")
  end

  it "maps each digit with formal Chinese digits" do
    10000.to_chinese(:simple => false).must_equal("壹零零零零")
  end

  it "emits zero in decimal mode" do
    0.to_chinese(:decimal => true).must_equal("零")
  end

  it "generates decimal notations in decimal mode" do
    12.to_chinese(:decimal => true).must_equal("一十二")
  end

  it "shortens middle zeros in decimal mode" do
    1002.to_chinese(:decimal => true).must_equal("一千零二")
  end

  it "omits the tail zero in decimal mode" do
    1200.to_chinese(:decimal => true).must_equal("一千二百")
  end

  it "omits all tail zeros in decimal mode" do
    10000000000.to_chinese(:decimal => true).must_equal("一百億")
  end

  it "knows output and omit zeros in decimal mode" do
    10000002000.to_chinese(:decimal => true).must_equal("一百億二千")
  end

end

