/// DAY 13: Simple Aggregations (Total Reward, Completed Count)
///
/// Today you will:
/// 1. Write functions that iterate over vectors
/// 2. Calculate totals and counts
/// 3. Practice with control flow

module challenge::day_13 {
    use std::string::String;

    /// Task status
    public enum TaskStatus has copy, drop {
        Open,
        Completed,
    }

    /// Task data
    public struct Task has copy, drop {
        title: String,
        reward: u64,
        status: TaskStatus,
    }

    /// Task board owned by an address
    public struct TaskBoard has drop {
        owner: address,
        tasks: vector<Task>,
    }

    /// Create a new task
    public fun new_task(title: String, reward: u64): Task {
        Task {
            title,
            reward,
            status: TaskStatus::Open,
        }
    }

    /// Create a new board
    public fun new_board(owner: address): TaskBoard {
        TaskBoard {
            owner,
            tasks: vector::empty(),
        }
    }

    /// Add a task to the board
    public fun add_task(board: &mut TaskBoard, task: Task) {
        vector::push_back(&mut board.tasks, task);
    }

    /// Find task index by title
    public fun find_task_by_title(
        board: &TaskBoard,
        title: &String
    ): Option<u64> {
        let len = vector::length(&board.tasks);
        let mut i = 0;

        while (i < len) {
            let task = vector::borrow(&board.tasks, i);
            if (&task.title == title) {
                return option::some(i)
            };
            i = i + 1;
        };

        option::none()
    }

    /// Sum of all task rewards
    public fun total_reward(board: &TaskBoard): u64 {
        let len = vector::length(&board.tasks);
        let mut i = 0;
        let mut total = 0;

        while (i < len) {
            let task = vector::borrow(&board.tasks, i);
            total = total + task.reward;
            i = i + 1;
        };

        total
    }

    /// Count how many tasks are completed
    public fun completed_count(board: &TaskBoard): u64 {
        let len = vector::length(&board.tasks);
        let mut i = 0;
        let mut count = 0;

        while (i < len) {
            let task = vector::borrow(&board.tasks, i);
            if (task.status == TaskStatus::Completed) {
                count = count + 1;
            };
            i = i + 1;
        };

        count
    }
}
