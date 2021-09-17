import React from "react";
import { receiveTodos } from "../../actions/todo_actions";
import TodoListItem from "../todo_list/todo_list_item";
import TodoForm from "../todo_list/todo_form";

class TodoList extends React.Component{
    render() {
       
        const todoItems = this.props.todos.map(todo => {
           return <TodoListItem  key={todo.id} todo={todo} receiveTodo={this.props.receiveTodo} />
        })
        return (
          <div>
            <ul>{todoItems}</ul>
            <TodoForm receiveTodo={this.props.receiveTodo} />
          </div>
        );
    }
}

export default TodoList;


// const newTodos = {
//     todos: {
//         1: {id:1, title: 'Learn Redux', body: 'It is fundamental', done: false},
//         2: {id:2, title: 'finish todos', body: 'it was hard', done: false}
//     }
// }