const initialState = {
  city: "Please Select",
  jobs: []
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type){
    case "SELECT_LOCATION",
      const newState = merge([], state);
      newState.city = action.city;
      newState.job = action.job;
      return newState;
    default:
      return state;
  }
};

export default reducer;
