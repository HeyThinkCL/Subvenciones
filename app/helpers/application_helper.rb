module ApplicationHelper
  def active(url)
    return ""
    if url == "/"<<request.path.split("/")[1]
      return "active"
    end
    return ""
  end

  def open(url)
    return ""
    if url == "/"<<request.path.split("/")[1]
      return "open"
    end
    return ""
  end
end
