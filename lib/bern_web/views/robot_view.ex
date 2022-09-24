defmodule BernWeb.RobotView do
  use BernWeb, :view

  def render("robots.txt", %{env: :prod}) do
    """
    User-agent: *
    Disallow: /admin
    """
  end

  def render("robots.txt", %{env: _}) do
    """
    User-agent: *
    Disallow: /
    """
  end

  def render("rss.xml", %{}) do
    site = SEO.Generic.new()
    BernWeb.Rss.generate(%BernWeb.Rss{
      title: site.site_title,
      author: "David Bernheisel",
      description: site.site_description,
      posts: Bern.Blog.published_posts()
    })
  end
end
