class List < ApplicationRecord
  belongs_to :board
  has_many :tasks

  def self.all_lists(board_id)
    List.find_by_sql("
      SELECT *
      FROM lists 
      WHERE lists.board_id = #{board_id}
      ORDER BY position
    ")
  end

  def self.single_list(board_id, list_id)
    List.find_by_sql(["
      SELECT *
      FROM lists
      WHERE lists.board_id = ? AND lists.id = ?
    ", board_id, list_id]).first
  end

  def self.one_list(list_id)
    List.find_by_sql("
      SELECT * 
      FROM lists
      WHERE lists.id = #{list_id}
    ").first
  end
end
