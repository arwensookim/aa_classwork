import React from "react";
import { uniqueId } from "../../util/util_id";

class TodoForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        title: "",
        body: "",
        done: false
    }
    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
  }

  updateTitle(e){
    this.setState({title: e.target.value})
  }

  updateBody(e){
    this.setState({ body: e.target.value});
  }

  handleSubmit(e){
      e.preventDefault();
      this.props.receiveTodo(this.state)
  }

  render(){
      return (
        <form onSubmit={this.handleSubmit}>
          <label> title:
            <input
              value={this.state.title}
              onChange={this.updateTitle}
              type="text"
            />
          </label>

          <label> body:
            <textarea 
              value={this.state.body}
              onChange={this.updateBody}
              type="text">
           </textarea>
          </label>
          <input type="submit" value="add todo!!"/>
        </form>
      );
  }
}





export default TodoForm;