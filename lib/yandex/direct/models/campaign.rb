module Yandex
  module Direct
    class Campaign < Base
      field :Id, type: Integer
      field :Name, type: String
      field :ClientInfo, type: Integer
      field :StartDate, type: Date
      field :EndDate, type: Date

      # :TimeTargeting, :TimeZone, :NegativeKeywords,
      #        :BlockedIps, :ExcludedSites, :DailyBudget, :Notification, :Type, :Status, :State, :StatusPayment,
      #        :StatusClarification, :SourceId, :Statistics, :Currency, :Funds, :RepresentedBy
      #
      # ATTRIBUTES = :Id, :Name, :ClientInfo, :StartDate, :EndDate, :TimeTargeting, :TimeZone, :NegativeKeywords,
      #     :BlockedIps, :ExcludedSites, :DailyBudget, :Notification, :Type, :Status, :State, :StatusPayment,
      #     :StatusClarification, :SourceId, :Statistics, :Currency, :Funds, :RepresentedBy
      #
      # attr_accessor *ATTRIBUTES
      #
      # def attributes
      #   {
      #       :Id => nil,
      #       :Name => nil
      #   }
      # end

      def self.get(selection_criteria)
        response = Yandex::Direct.request('get', self.path, selection_criteria.fields(self.fields.keys))
        Yandex::Direct.parse(response, 'Campaigns',self)
      end

      def self.find(id)
        self.where(Ids: Array(id)).call(:get).first
      end

      def self.archive(selection_criteria)
        response = Yandex::Direct.request('archive', self.path, selection_criteria)
        Yandex::Direct.parse(response, 'ArchiveResults', Yandex::Direct::ActionResult)
      end

      def archive
        self.class.where(Ids: [self.Id]).call(:archive).first
      end

      def self.unarchive(selection_criteria)
        response = Yandex::Direct.request('unarchive', self.path, selection_criteria)
        Yandex::Direct.parse(response, 'UnarchiveResults', Yandex::Direct::ActionResult)
      end

      def unarchive
        self.class.where(Ids: [self.Id]).call(:unarchive).first
      end

      def self.resume(selection_criteria)
        response = Yandex::Direct.request('resume', self.path, selection_criteria)
        Yandex::Direct.parse(response, 'ResumeResults', Yandex::Direct::ActionResult)
      end

      def resume
        self.class.where(Ids: [self.Id]).call(:resume).first
      end

      def self.suspend(selection_criteria)
        response = Yandex::Direct.request('suspend', self.path, selection_criteria)
        Yandex::Direct.parse(response, 'SuspendResults', Yandex::Direct::ActionResult)
      end

      def suspend
        self.class.where(Ids: [self.Id]).call(:suspend).first
      end

      def self.delete(selection_criteria)
        response = Yandex::Direct.request('delete', self.path, selection_criteria)
        Yandex::Direct.parse(response, 'DeleteResults', Yandex::Direct::ActionResult)
      end

      def delete
        self.class.where(Ids: [self.Id]).call(:delete).first
      end

      # TODO: add, update
      # TODO: TextCampaign, DynamicTextCampaign, MobileAppCampaign

    end
  end
end
