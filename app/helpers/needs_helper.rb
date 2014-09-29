module NeedsHelper

  def humanise_organisation_ids(string)
    (string || "").split(",").map {|str|
      sanitize(str.underscore.humanize.titleize)
    }.join('<br>').html_safe
  end

  def format_percentage_score(percentage)
    string = number_to_percentage(percentage, significant: 4)
    content_tag :span, string, class: class_for_percentage(percentage)
  end

private
  def class_for_percentage(percentage)
    case
    when percentage > 80.0 then 'positive'
    when percentage > 60.0 then 'neutral'
    else
      'negative'
    end
  end

end
