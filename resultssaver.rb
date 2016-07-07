class ResultsSaver

  def initialize

  end

  def save_batch(results, filename)
    File.open("./results/#{filename}.txt","w") do |file|
      results.each do |word|
        file.puts "#{word}"
      end
     puts "Results saved into #{filename}.txt!"
    end

  end

end
