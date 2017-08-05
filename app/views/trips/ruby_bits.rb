class Test
  def initialize(options)
    @options = options
  end

  def call(test)
    puts "This is first line"
    Test.another_call
  end

  private
    def self.another_call
      puts "This is new line"
    end
end


this = Test.new("this is new")

this.call(Test.new('this is ok'))