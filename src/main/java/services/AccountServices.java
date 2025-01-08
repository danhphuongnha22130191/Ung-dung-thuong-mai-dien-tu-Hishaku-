package services;

import dao.GenericDao;
import models.Account;
import models.Customer;
import utils.AccountUtil;
import utils.QueryUtil;

public class AccountServices {
	/**
	 * Lấy id tài khoản từ thông tin email
	 * 
	 * @param email
	 * @return id nếu tồn tại, ngược lại null
	 */
	public static Integer getIdAccount(String email) {
		if (email == null || email.isBlank()) {
			System.err.println("Email null hoặc rỗng");
			return null;
		}
		String condition = QueryUtil.createCondition("email", QueryUtil.EQUALS, 0, QueryUtil.EMPTY);
		String query = QueryUtil.createQuery(Account.class, "id", condition);
		return GenericDao.excuteQueryGetSingle(Account.class, Integer.class, query, email);
	}

	/**
	 * Đăng nhập
	 * 
	 * @param id
	 * @param password
	 * @return true nếu thành công
	 */
	public static Integer login(String email, String password) {
		if (email == null || email.isBlank() || password == null || password.isBlank()) {
			System.err.println("Email hoặc pass null hoặc rỗng");
			return null;
		}
		Integer id = getIdAccount(email);
		if (id == null)
			return null;
		String condition = QueryUtil.createCondition("id", QueryUtil.EQUALS, 0, QueryUtil.EMPTY);
		String query = QueryUtil.createQuery(Account.class, "password", condition);
		String storedPassword = GenericDao.excuteQueryGetSingle(Account.class, String.class, query, id);
		return AccountUtil.verifyPassword(password, storedPassword) ? id : null;

	}

	/**
	 * Tạo tài khoản
	 * 
	 * @param acc dữ liệu về tài khoản
	 * @return
	 */
	public static boolean createAccount(Account acc) {
		acc.setPassword(AccountUtil.hashPassword(acc.getPassword()));
		if (GenericDao.insert(acc.getCustomer(), false) && GenericDao.insert(acc, false)) {
			GenericDao.commit();
			return true;
		}
		return false;
	}

	public static boolean updateCustomer(Customer customer) {
		return GenericDao.update(customer, true);
	}

	/**
	 * Lấy thông tin customer
	 * 
	 * @param accountId
	 * @return custome, ngược lại null
	 */
	public static Customer getCustomer(Integer accountId) {
		return null;
	}

	/**
	 * Lấy thông tin tài khoản từ accountId
	 * 
	 * @param
	 * @return account, ngược lại null
	 */
	public static Account getAccount(Integer accountId) {
		return null;
	}

	public static boolean updateAccount(Account account) {
		return GenericDao.update(account, true);
	}

}
