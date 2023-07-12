require 'httparty'
require 'retryable'
require 'uri'

class PokeApiService
  include HTTParty
  base_uri 'https://pokeapi.co/api/v2'

  def initialize(options = {})
    @options = options
    @pokemons = []
    @types = []
  end

  def fetch_all_types
    response = self.class.get('/type')

    raise 'Error fetching all types' unless response.success?

    count = response['count']

    types_links = self.class.get('/type', query: { limit: count })['results']

    types_links.map do |type_link|
      @types << fetch_detail_entity(type_link['url'])['name']
    end

    @types
  end

  def fetch_all_pokemons
    response = self.class.get('/pokemon')

    raise 'Error fetching all pokemons' unless response.success?

    count = response['count']

    pokemons_links = self.class.get('/pokemon', query: { limit: count })['results']

    pokemons_links.map do |pokemon_link|
      @pokemons << fetch_detail_entity(pokemon_link['url'])
    end

    @pokemons
  end

  def fetch_detail_entity(url)
    response = self.class.get(url)

    raise 'Error fetching type' unless response.success?

    response
  end
end
