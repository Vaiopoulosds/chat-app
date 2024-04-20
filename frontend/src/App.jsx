import { useEffect, useState } from "react";
import Home from "./pages/home";
import Dashboard from "./pages/dashboard";
import { useGetUsers } from "./queryHooks/getusers";

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState();
  const {data, isSuccess} = useGetUsers()

  useEffect(() =>{
    if (isSuccess) setIsLoggedIn(true)
    else setIsLoggedIn(false)
  }, [isSuccess])

  if (isLoggedIn) return <Dashboard></Dashboard>
  else return <Home />;
}

export default App;
