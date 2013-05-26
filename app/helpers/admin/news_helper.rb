module Admin::NewsHelper
  def count_news
    @count_news ||= Article.where(:ty_id => 23).count
  end
end
