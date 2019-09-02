class Task < ApplicationRecord
  belongs_to :list

  def self.all_tasks(list_id)
    Task.find_by_sql("
      SELECT *
      FROM tasks
      WHERE tasks.list_id = #{list_id}
      ORDER BY priority
    ")
  end

  def self.single_task(list_id, task_id)
    Task.find_by_sql(["
      SELECT *
      FROM tasks
      WHERE tasks.list_id = ? AND tasks.id = ?
    ", list_id, task_id]).first
  end
end
