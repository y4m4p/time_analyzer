# 打刻内容のENUMもどき
module Subject
  ARRIVAL = 0
  RESTING = 1
  CODING = 2
  THINKING = 3
  MEETING = 4
  SUPPLEMENTAL = 90
  GOHOME = 99

  SUBJECT_NAME = {
    Subject::ARRIVAL => '出勤',
    Subject::RESTING => '休憩',
    Subject::CODING => '実装',
    Subject::THINKING => '調べ物・思考',
    Subject::MEETING => '会議・面談・その他',
    Subject::SUPPLEMENTAL => '補足',
    Subject::GOHOME => '退勤'
  }

  def self.all
    self.constants.map{ |name| self.const_get(name) }
  end
end
