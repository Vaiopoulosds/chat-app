const Conversation = () => {
  return (
    <>
      <div className="container text-center mw-100 back-color ">
        <h1 className="display-6">Conversation with ..</h1>
      </div>
      <div className="container d-flex justify-content-center flex-wrap no-color">
        <div
          className="container rounded back-color row border"
          style={{ height: "80vh" }}
        >
          main conversation
        </div>
        <div className="container rounded bg-info row border">
          message to send
        </div>
      </div>
    </>
  );
};

export default Conversation;
