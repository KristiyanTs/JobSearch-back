class Symbol
  def with(*args, &block)
    ->(caller, *rest) { caller.send(self, *rest, *args, &block) }
  end
end

#https://stackoverflow.com/questions/23695653/can-you-supply-arguments-to-the-mapmethod-syntax-in-ruby
# a = [1,3,5,7,9]
# a.map(&:+.with(2))
# # => [3, 5, 7, 9, 11] 