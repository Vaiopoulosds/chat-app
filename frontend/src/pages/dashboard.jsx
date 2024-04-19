const Dashboard = () => {
  return (
    <>
      <h2 className="display-6 bg-info-subtle pt-2 pb-2"> Username</h2>
      <div className="container">
        <div className="row mt-3 mb-3">
          <div className="col-6 col-lg-2 rounded border me-lg-2" style={{ height: "80vh" }}>
            Find People
          </div>
          <div className="col-6 col-lg-8 rounded border" style={{ height: "80vh" }}> Past Conversations</div>
        </div>
      </div>
    </>
  );
};

export default Dashboard;
