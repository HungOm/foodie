module Searchable
    extend ActiveSupport::Concern
  
    included do
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks
    # end



#    def as_indexed_json(_options = {})
#     as_json(only: %i[name description])
#    end



#     def settings_attributes
#         {
#           index: {
#             analysis: {
#               analyzer: {
#                 # we define custom analyzer with name autocomplete
#                 autocomplete: {
#                   # type should be custom for custom analyzers
#                   type: :custom,
#                   # we use standard tokenizer
#                   tokenizer: :standard,
#                   # we apply two token filters
#                   # autocomplete filter is a custom filter that we defined above
#                   filter: %i[lowercase autocomplete]
#                 }
#               },
#               filter: {
#                 # we define custom token filter with name autocomplete
#                 autocomplete: {
#                   type: :edge_ngram,
#                   min_gram: 2,
#                   max_gram: 25
#                 }
#               }
#             }
#           }
#         }
#     end



#     settings settings_attributes do
#         mappings dynamic: 'false' do
#           indexes :name, type: :text, analyzer: :autocomplete
#           indexes :description, type: :text
#         end
#       end


#     #   settings do
#     #     mappings dynamic: 'false' do
#     #       indexes :name, type: :text, analyzer: :autocomplete
#     #       indexes :descriptions, type: :text
#     #     end
#     #   end




#       def self.search(query, filters)
#         set_filters = lambda do |context_type, filter|
#           @search_definition[:query][:bool][context_type] |= [filter]
#          end
   
#         @search_definition = {
#           size: 5,
#           query: {
#             bool: {
#               must: [],
#               should: [],
#               filter: []
#             }
#           }
#         }
   
#         if query.blank?
#           set_filters.call(:must, match_all: {})
#         else
#           set_filters.call(
#             :must,
#             match: {
#               name: {
#                 query: query,
#                 fuzziness: 1
#               }
#             }
#           )
#         end
   
#         if filters[:description].present?
#           set_filters.call(:filter, term: { description: filters[:description] })
#         end
   
#         __elasticsearch__.search(@search_definition)
#       end
   
#     class_methods do
#       def settings_attributes
#         {
#           index: {
#             analysis: {
#               analyzer: {
#                 autocomplete: {
#                   type: :custom,
#                   tokenizer: :standard,
#                   filter: %i[lowercase autocomplete]
#                 }
#               },
#               filter: {
#                 autocomplete: {
#                   type: :edge_ngram,
#                   min_gram: 2,
#                   max_gram: 25
#                 }
#               }
#             }
#           }
#         }
#       end
#     end


# settings do
#     mappings dynamic: false do
#       indexes :id, index: :not_analyzed
#       indexes :name, type: :text, analyzer: :english
#       indexes :descriptions, type: :text, analyzer: :english
#       indexes :ingredients, type: :keyword
#     end
#   end



  
    end

    
end
