require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do 
    @name = params[:name]
    "#{@name.reverse}"
  end

  get '/square/:number' do
    @num = params[:number].to_i
    "#{@num * @num}"
  end

  get '/say/:number/:phrase' do
    @num = params[:number].to_i
    @phrase = params[:phrase]

    "#{ [@phrase].cycle(@num).to_a.join(' ')  }"
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @words = Array.new
    params.each {|key, value| @words << value }

    "#{ @words.join(' ') << '.' }"
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    
    case @operation
    when "add"
      "#{@num1 + @num2}"
    when "subtract"
      "#{@num2 - @num1}"
    when "divide"
      "#{@num1 / @num2}"
    when "multiply"
      "#{@num1 * @num2}"
    end
  end

end