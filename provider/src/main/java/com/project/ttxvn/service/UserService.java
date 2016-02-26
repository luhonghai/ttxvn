package com.project.ttxvn.service;

import com.project.ttxvn.dao.IUserDAO;
import com.project.ttxvn.dao.daoImpl.UserDAOImpl;
import com.project.ttxvn.model.User;
import com.project.ttxvn.utils.MD5Helper;

import javax.ws.rs.*;
import java.util.List;


@Path("user")
public class UserService extends BaseService<User, IUserDAO, UserDAOImpl>{

	public UserService() {
		super(IUserDAO.class, UserDAOImpl.class);
	}

	@Override
	@GET
	@Path("/delete")
	@Produces("application/json")
	public boolean delete(@QueryParam("id") long id) {
		return super.delete(id);
	}
	
	@Override
	@POST
	@Path("/save")
	@Produces("application/json")
	public User save(User obj) {
		if (obj.getId() > 0) {
			User tmp = getBean().find(obj.getId());
			tmp.setAddress(obj.getAddress());
			tmp.setDob(obj.getDob());
			tmp.setEmail(obj.getEmail());
			tmp.setFirstName(obj.getFirstName());
			tmp.setGender(obj.isGender());
			if (obj.getPassword() != null && obj.getPassword().length() > 0) {
				tmp.setPassword(MD5Helper.md5(obj.getPassword()));
			}
			tmp.setPhone(obj.getPhone());
			tmp.setLastName(obj.getLastName());
			tmp.setRole(obj.getRole());
			return getBean().edit(tmp);
		} else {
			obj.setPassword(MD5Helper.md5(obj.getPassword()));
			return super.save(obj);	
		}
	}
	
	@Override
	@GET
	@Path("/find")
	@Produces("application/json")
	public User find(@QueryParam("id") long id) {
		return super.find(id);
	}
	
	@GET
	@Path("/findbyrole")
	@Produces("application/json")
	public List<User> findByRole(@QueryParam("role") int role) {
		return ((IUserDAO) getBean()).findByRole(role);
	}
	
	@Override
	@GET
	@Path("/list")
	@Produces("application/json")
	public List<User> findAll() {
		return super.findAll();
	}
	
	public User login(String username, String password, int role) {
		return ((IUserDAO) getBean()).login(username, MD5Helper.md5(password), role);
	}

	public User login(String username, String password) {
		return ((IUserDAO) getBean()).login(username, MD5Helper.md5(password));
	}
}
