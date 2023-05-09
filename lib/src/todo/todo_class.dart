class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise/Football training', isDone: true ),
      ToDo(id: '02', todoText: 'Buy Groceries', isDone: true ),
      ToDo(id: '03', todoText: 'Check Emails', ),
      ToDo(id: '04', todoText: 'Team Meeting', ),
      ToDo(id: '05', todoText: 'Work on mobile apps for 2 hour', ),
      ToDo(id: '06', todoText: 'Dinner with James', ),
      ToDo(id: '07', todoText: 'Meeting with the Governor of PLateau State', ),
      ToDo(id: '08', todoText: 'Going to Gambia beach', ),
      ToDo(id: '09', todoText: 'Making research on Matters concerning Projects', ),
      ToDo(id: '10', todoText: 'Check for books in the Library', ),
      ToDo(id: '11', todoText: 'Team Meeting with some clients', ),
      ToDo(id: '12', todoText: 'Work on mobile apps for some hour', ),
      ToDo(id: '13', todoText: 'Dinner with friends', ),
      ToDo(id: '14', todoText: 'Traveling to Abuja for a conference/seminar', ),
      ToDo(id: '15', todoText: 'Facts checking on some debate', ),
      ToDo(id: '16', todoText: 'Making some enquiries about the concept of firebase', ),
    ];
  }
}