require 'singleton'

require 'mongo'
# data_objects required under export_to dependant on adapter requested in EXPORT_DBMS

module Squealer
  class Database
    include Singleton

    def import_from(host, port, name)
      creds, host = host.split("@")
      if host.nil?
        host = creds
        @import_dbc = Mongo::Connection.new(host, port, :slave_ok => true).db(name)
      else
        un, pw = creds.split(":")
        @import_dbc = Mongo::Connection.new(host, port, :slave_ok => true).db(name)
        @import_dbc.authenticate(un, pw)
      end

      @import_connection = Connection.new(@import_dbc)
    end

    def export_to(adapter, host, username, password, name)
      require "do_#{adapter}"

      @export_do.release if @export_do
      creds = ""
      creds << username if username
      creds << ":#{password}" if password
      at_host = ""
      at_host << "#{creds}@" unless creds.empty?
      at_host << host
      @export_do = DataObjects::Connection.new("#{adapter}://#{at_host}/#{name}")
    end

    def import
      @import_connection
    end

    def export
      @export_do
    end

    def upsertable?
      defined?(DataObjects::Mysql) && @export_do.is_a?(DataObjects::Mysql::Connection)
    end

    class Connection
      attr_reader :collections

      def initialize(dbc)
        @dbc = dbc
        @collections = {}
      end

      def source(collection, conditions = {}, &block)
        source = Source.new(@dbc, collection)
        @collections[collection] = source
        source.source(conditions, &block)
      end

      def eval(string)
        @dbc.eval(string)
      end
    end # Connection

    class Source
      attr_reader :counts, :cursor

      def initialize(dbc, collection)
        @counts = {:exported => 0, :imported => 0}
        @collection = dbc.collection(collection)
      end

      def source(conditions)
        @cursor = block_given? ? yield(@collection) : @collection.find(conditions)
        @counts[:total] = cursor.count
        @progress_bar = Squealer::ProgressBar.new(cursor.count)
        self
      end

      def each
        @progress_bar.start if @progress_bar
        @cursor.each do |row|
          @counts[:imported] += 1
          yield row
          @progress_bar.tick if @progress_bar
          @counts[:exported] += 1
        end
        @progress_bar.finish if @progress_bar
      end
    end # Source

  end
end
