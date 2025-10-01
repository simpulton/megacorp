import styles from './page.module.scss';

export default function Index() {
  /*
   * Replace the elements below with your own.
   *
   * Note: The corresponding styles are in the ./index.scss file.
   */
  return (
    <div className={styles.page}>
      <div className="wrapper">
        <div className="container">
          <div id="welcome">
            <h1> Welcome to the dashboard!</h1>
            <p>This is the dashboard for the application.</p>
          </div>
        </div>
      </div>
    </div>
  );
}
