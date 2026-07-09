# Auto-links bare URLs (e.g. "출처: https://...") in post bodies.
# Runs after markdown conversion, before layout, and skips <pre>...</pre>
# blocks so URLs pasted inside code fences are left untouched.
Jekyll::Hooks.register :documents, :post_convert do |document|
  next unless document.respond_to?(:collection) && document.collection.label == "posts"

  segments = document.content.split(%r{(<pre[\s\S]*?</pre>)})
  document.content = segments.each_with_index.map do |segment, index|
    next segment if index.odd? # inside <pre>...</pre>

    segment.gsub(%r{(?<!["'>])https?://[^\s<]+}) do |url|
      trailing = url[/[.,;:!?)\]}"']+\z/]
      url = url.delete_suffix(trailing) if trailing
      %(<a href="#{url}" target="_blank" rel="noopener noreferrer">#{url}</a>#{trailing})
    end
  end.join
end
