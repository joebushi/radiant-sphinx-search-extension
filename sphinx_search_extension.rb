class SphinxSearchExtension < Radiant::Extension
  version "0.8.0"
  description "Search Pages with ThinkingSphinx"
  url "http://digitalpulp.com"
  
  extension_config do |config|
    config.gem 'thinking-sphinx-099', :lib => 'thinking_sphinx', :version => '1.2.12'
    config.gem 'rgrove-sanitize', :lib => 'sanitize'
  end
  
  def activate
    Page.send(:include, SphinxSearch::PageExtensions)
    admin.page.edit.add :extended_metadata, "search_toggle"
  end
  
  def deactivate
  end
  
end