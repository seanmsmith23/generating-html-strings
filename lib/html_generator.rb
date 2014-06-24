class HTMLGenerator

  def initialize(string="")
    @given = string
  end

  def replace_content(output)
    if @given.include?("CONTENT")
      @given.sub("CONTENT", output)
    else output
    end
  end

  def section(string)
    output = "<section>" + string + "</section>"
    replace_content(output)
  end

  def unordered_list(array_of_strings)
    list_items = array_of_strings.map { |item| "<li>" + item + "</li>" }.join
    unordered_lists = "<ul>#{list_items}</ul>"
    output = unordered_lists

    replace_content(output)
  end

  def button(string, type_hash=nil)
    if type_hash == nil
      output = "<button>" + string + "</button>"
    else
      class_type = type_hash.values_at(:class).join
      output = "<button class='#{class_type}'>" + string + "</button>"
    end
    replace_content(output)
  end

end