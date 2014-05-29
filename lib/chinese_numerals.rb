# encoding: UTF-8

Integer.class_eval do
  CHINESE_GROUPS = [ '', '萬', '億', '兆', '京', '陔' ]

  FORMAL_CHINESE_NUMBERS = %w{ 零 壹 貳 參 肆 伍 陸 柒 捌 玖 }
  FORMAL_CHINESE_DECIMALS = [ '', '拾', '佰', '仟' ]

  SIMPLE_CHINESE_NUMBERS = %w{ 零 一 二 三 四 五 六 七 八 九 }
  SIMPLE_CHINESE_DECIMALS = [ '', '十', '百', '千' ]

  def to_chinese(args = {})
    opts = {
      :simple => true,
      :decimal => false
    }.merge args

    chinese_numbers  = opts[:simple] ? SIMPLE_CHINESE_NUMBERS  : FORMAL_CHINESE_NUMBERS
    chinese_decimals = opts[:simple] ? SIMPLE_CHINESE_DECIMALS : FORMAL_CHINESE_DECIMALS

    str = self.to_s
    len = str.length
    res = ""

    if opts[:decimal] && (len > 1)
      # counting zeros if it meets
      zeros = 0

      0.upto len - 1 do |i|
        digit = str[i].to_i
        if digit == 0
          zeros += 1
        else
          if (zeros > 0)
            zeros = 0
            res << chinese_numbers[0]
          end
          res << chinese_numbers[digit] + chinese_decimals[(len - 1 - i) % 4]
        end
        # append group name unless 4 zeros met
        if (len - 1 - i) % 4 == 0
          res << CHINESE_GROUPS[(len - 1 - i) / 4] unless zeros == 4
          # reset zeros for each group
          zeros = 0
        end
      end

    else
      # simply maps each digit
      0.upto len - 1 do |i|
        digit = str[i].to_i
        res << chinese_numbers[digit]
      end
    end

    res
  end

end
