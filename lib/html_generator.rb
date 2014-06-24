class HTMLGenerator

  def initialize(string="")
    @given = string
  end

  def section(string)
    output = "<section>" + string + "</section>"
    if @given.include?("CONTENT")
        @given.sub("CONTENT", output)
    else output
    end
  end

  def unordered_list(array_of_strings)
    open_list = "<ul>"
    close_list = "</ul>"
    li = "<li>"
    close_li = "</li>"

    list_with_input = array_of_strings.map { |item| li + item + close_li }

    output = open_list + list_with_input.join + close_list
    if @given.include?("CONTENT")
      @given.sub("CONTENT", output)
    else output
    end
  end

  def button(string, type_hash=nil)
    if type_hash == nil
      output = "<button>" + string + "</button>"
    else
      class_type = type_hash.values_at(:class).join
      output = "<button class='#{class_type}'>" + string + "</button>"
    end
    if @given.include?("CONTENT")
      @given.sub("CONTENT", output)
    else output
    end
  end
end