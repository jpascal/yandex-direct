module Yandex
  module Direct
    class Campaign < Yandex::Direct::Model
      field :Id, type: :integer
      field :Name, type: :string
      field :ClientInfo, type: :integer
      field :StartDate, type: :date
      field :EndDate, type: :date
      field :TimeTargeting, type: :string
      field :TimeZone, type: :string
      field :NegativeKeywords, type: :string
      field :BlockedIps, type: :string
      field :ExcludedSites, type: :string
      field :DailyBudget, type: :string
      field :Notification, type: :string
      field :Type, type: :string
      field :Status, type: :string
      field :State, type: :string
      field :StatusPayment, type: :string
      field :StatusClarificatio, type: :string
      field :SourceId, type: :string
      field :Statistics, type: :string
      field :Currency, type: :string
      field :Funds, type: :string
      field :RepresentedBy, type: :string
      # TODO: field :TextCampaign, type: TextCampaign
      # TODO: field :DynamicTextCampaign, type: DynamicTextCampaign
      # TODO: field :MobileAppCampaign, type: MobileAppCampaign

      def self.get(selection_criteria)
        response = Yandex::Direct.request('get', self.path, selection_criteria.fields(*self.fields.keys))
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

    end
  end
end
