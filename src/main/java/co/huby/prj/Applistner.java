package co.huby.prj;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

/**
 * Application Lifecycle Listener implementation class Applistner
 *
 */
@WebListener
public class Applistner implements HttpSessionAttributeListener, ServletContextListener {

	/**
	 * Default constructor.
	 */
	static Set<String> userList = new HashSet<String>();

	public static Set<String> getUserList() {
		return userList;
	}

	public Applistner() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
	 */
	public void attributeAdded(HttpSessionBindingEvent event) {
		if (event.getSession().getAttribute("loginId") != null)
			userList.add((String) event.getSession().getAttribute("loginId"));
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
	 */
	public void attributeRemoved(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		if (event.getSession().getAttribute("loginId") != null)
			userList.remove((String) event.getSession().getAttribute("loginId"));
	}

	/**
	 * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
	 */
	public void attributeReplaced(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
	}

}
