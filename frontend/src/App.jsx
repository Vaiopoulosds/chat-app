import { useEffect, useState } from "react";
import Home from "./components/home";
import Dashboard from "./components/dashboard";
import { useGetCurrentUser } from "./queryHooks/getcurrecntUser";

function App() {
  const {isSuccess} = useGetCurrentUser()
  const [isLoggedIn, setIsLoggedIn] = useState();

  useEffect(() =>{
    if (isSuccess) setIsLoggedIn(true)
    else setIsLoggedIn(false)
  }, [isSuccess])

  if (isLoggedIn) return <Dashboard setIsLoggedIn={setIsLoggedIn}></Dashboard>
  else return <Home setIsLoggedIn={setIsLoggedIn}/>;
}

export default App;
