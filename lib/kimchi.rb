class Kimchi
  
  def uri(uri)
    puts uri
  end
  
  def feature(feature)
    puts feature.keyword
  end
  
  def background(background)
    puts background.keyword
  end
  
  def scenario(scenario)
    puts scenario.keyword
  end

  def scenario_outline(outline)
    puts outline.keyword
  end

  def examples(examples)
    puts examples.keyword
  end

  def step(step)
    puts step.keyword
  end
  
  def comment(comment)
    puts comment.content
  end
  
  def tag(tag)
    puts tag.keyword
  end
  
  def table(content)
    puts content
  end
  
  def py_string(string)
    puts string
  end
  
  def eof()
    puts "parsed..."
  end
  
end