# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  popular    :boolean          default(FALSE)
#

module AlbumsHelper
  def with_status(album)
    title = album.title
    title += content_tag(:small, "hot!") if album.popular?
    title.html_safe
  end
end
