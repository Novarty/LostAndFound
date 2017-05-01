class ItemDecorator  < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def get_author
    user = User.find_by_id(user_id)
    " #{user.name} #{user.surname}"
  end

  def tag_links(tags)
    tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
  end

  # def tag_cloud(tags, classes)
  #   max = tags.sort_by(&:count).last
  #   tags.each do |tag|
  #     index = tag.count.to_f / max.count * (classes.size - 1)
  #     yield(tag, classes[index.round])
  #   end
  # end
end
