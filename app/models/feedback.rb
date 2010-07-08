class Feedback <CouchRest::ExtendedDocument
  use_database COUCHDB_SERVER
  property :email
  property :changes_required
  property :reason_for_changes

  view_by :feedbacks,
      :map =>" function(doc) {
      if (doc['couchrest-type'] == 'Feedback') {
emit(doc.email,doc) }}"

  def self.all_feedback
  Feedback.view("by_feedbacks")
end

end