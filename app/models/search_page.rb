class SearchPage < Page
  include SphinxSearch::RadiusTags
  include WillPaginate::ViewHelpers
  attr_accessor :results, :query

  @@per_page = 10

  def cache?
    true
  end

  def process(request, response)
    @query ||= request.params[:query]
    # Ensure search is not run with empty term
    @results = @query.blank? ? ThinkingSphinx::Search.new(0,@@per_page,0,0) :
                               Page.search(@query, :conditions => { :searchable => 1, :status_id => 100 }, :page => request.params[:page], :per_page => @@per_page)
    super
  end
end