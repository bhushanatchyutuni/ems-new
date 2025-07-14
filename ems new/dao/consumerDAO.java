package com.ems.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ems.model.Bill;
import com.ems.model.Complaint;
import com.ems.model.Consumer;


public class consumerDAO {

    public boolean validationCheck(String email, String password) {
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM login WHERE email=? AND password=?")) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public String getConsumerName(String email) {
        String name = "";
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT name FROM customer WHERE email = ?")) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
					name = rs.getString("name");
				}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public String getConsumerID(String email) {
        String id = "";
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT consumerid FROM customer WHERE email = ?")) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
					id = rs.getString("consumerid");
				}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }

    public String getUserID(String email) {
        String id = "";
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT userid FROM login WHERE email = ?")) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
					id = rs.getString("userid");
				}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }



    public String getConsumerStatus(String email) {
        String status = "";
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT status FROM login WHERE email = ?")) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
					status = rs.getString("status");
				}
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int addConsumer(Consumer cs) {
        new DbUtility();
		try (Connection con = DbUtility.createConnection()) {

            // Check if email exists
            try (PreparedStatement check = con.prepareStatement("SELECT email FROM login WHERE email = ?")) {
                check.setString(1, cs.getEmail());
                try (ResultSet rs = check.executeQuery()) {
                    if (rs.next()) {
						return -1;
					}
                }
            }

            // Insert into login
            try (PreparedStatement ps1 = con.prepareStatement(
                    "INSERT INTO login (email, password, userType, status) VALUES (?, ?, 'Customer', 'Active')")) {
                ps1.setString(1, cs.getEmail());
                ps1.setString(2, cs.getPass());
                ps1.executeUpdate();
            }

            // Insert into customer
            try (PreparedStatement ps2 = con.prepareStatement(
                    "INSERT INTO customer (consumerId, name, email, mobile) VALUES (?, ?, ?, ?)")) {
                ps2.setString(1, cs.getConsumerId());
                ps2.setString(2, cs.getName());
                ps2.setString(3, cs.getEmail());
                ps2.setString(4, cs.getMobile());
                return ps2.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Bill> getUnpaidBills(String consumerId) {
        List<Bill> list = new ArrayList<>();
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM bill WHERE consumerId = ? AND status = 'Unpaid'")) {
            ps.setString(1, consumerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Bill b = new Bill();
                    b.setBillNo(rs.getInt("billNo"));
                    b.setMonth(rs.getString("month"));
                    b.setUnits(rs.getInt("units"));
                    b.setAmount(rs.getDouble("amount"));
                    b.setStatus(rs.getString("status"));
                    b.setBillDate(rs.getString("billDate"));
                    list.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Consumer> adminGetAllCustomers() {
        List<Consumer> list = new ArrayList<>();
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM Customer where consumerid != 'admin'")) {

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Consumer b = new Consumer();
                    b.setConsumerId(rs.getString("consumerid"));
                    b.setName(rs.getString("name"));
                    b.setMobile(rs.getString("mobile"));
                    b.setEmail(rs.getString("email"));


                    list.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Bill> getAllBills(String consumerId) {
        List<Bill> list = new ArrayList<>();
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM bill WHERE consumerId = ?")) {
            ps.setString(1, consumerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Bill b = new Bill();
                    b.setBillNo(rs.getInt("billNo"));
                    b.setMonth(rs.getString("month"));
                    b.setUnits(rs.getInt("units"));
                    b.setAmount(rs.getDouble("amount"));
                    b.setStatus(rs.getString("status"));
                    b.setBillDate(rs.getString("billDate"));
                    b.setPaymentDate(rs.getString("paymentDate"));
                    list.add(b);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Bill getBillByNo(int billNo) {
        Bill bill = null;
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM bill WHERE billNo = ?")) {
            ps.setInt(1, billNo);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    bill = new Bill();
                    bill.setBillNo(rs.getInt("billNo"));
                    bill.setMonth(rs.getString("month"));
                    bill.setUnits(rs.getInt("units"));
                    bill.setAmount(rs.getDouble("amount"));
                    bill.setStatus(rs.getString("status"));
                    bill.setBillDate(rs.getString("billDate"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bill;
    }

    public int markBillAsPaid(int billNo) {
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement(
                     "UPDATE bill SET status = 'Paid', paymentDate = CURRENT_DATE WHERE billNo = ?")) {
            ps.setInt(1, billNo);
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public String getUserType(String email) {
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement("SELECT userType FROM login WHERE email = ?")) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("userType");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Customer"; // default fallback
    }
    public Consumer getConsumerByEmail(String email) {
        Consumer c = null;
        DbUtility dbutilty = new DbUtility();
        Connection con = null;
        try {
            con = DbUtility.createConnection();
            PreparedStatement ps = con.prepareStatement("SELECT c.consumerId, c.name, c.email, c.mobile, l.status FROM customer c JOIN login l ON c.email = l.email WHERE c.email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                c = new Consumer();
                c.setConsumerId(rs.getString("consumerId"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setMobile(rs.getString("mobile"));
                c.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }

    public boolean updateCustomerInfoOnly(Consumer c) {
        System.out.println(" [updateCustomerInfoOnly] Starting for consumerId: " + c.getConsumerId());

        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE customer SET name=?, email=?, mobile=? WHERE consumerId=?")) {

            System.out.println(" [updateCustomerInfoOnly] Executing UPDATE on customer");
            ps.setString(1, c.getName());
            ps.setString(2, c.getEmail());
            ps.setString(3, c.getMobile());
            ps.setString(4, c.getConsumerId());

            int result = ps.executeUpdate();
            System.out.println(" [updateCustomerInfoOnly] Rows affected: " + result);
            return result > 0;

        } catch (Exception e) {
            System.out.println(" [updateCustomerInfoOnly] Error occurred:");
            e.printStackTrace();
        }

        return false;
    }




    public boolean updateStatus(String consumerId, String newStatus) {
    	  new DbUtility();
		try (Connection con = DbUtility.createConnection()) {
    	    PreparedStatement ps = con.prepareStatement("UPDATE login SET status = ? WHERE email = (SELECT email FROM customer WHERE consumerId=?)");
    	    ps.setString(1, newStatus);
    	    ps.setString(2, consumerId);
    	    return ps.executeUpdate() > 0;
    	  } catch (Exception e) {
    	    e.printStackTrace();
    	    return false;
    	  }
    	}

    public Consumer getConsumerById(String id) {
        Consumer c = null;
        new DbUtility();
		try (Connection con = DbUtility.createConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT c.consumerId, c.name, c.email, c.mobile, l.status " +
                 "FROM customer c JOIN login l ON c.email = l.email WHERE c.consumerId = ?")) {

            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                c = new Consumer();
                c.setConsumerId(rs.getString("consumerId"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                c.setMobile(rs.getString("mobile"));
                c.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return c;
    }


    	private String getStatusByEmail(String email) {
    	  new DbUtility();
		try (Connection con = DbUtility.createConnection()) {
    	    PreparedStatement ps = con.prepareStatement("SELECT status FROM login WHERE email = ?");
    	    ps.setString(1, email);
    	    ResultSet rs = ps.executeQuery();
    	    if (rs.next()) {
    	      return rs.getString("status");
    	    }
    	  } catch (Exception e) {
    	    e.printStackTrace();
    	  }
    	  return "Unknown";
    	}

    	public boolean isCustomerInfoSame(Consumer newData) {
    	    new DbUtility();
			try (Connection con = DbUtility.createConnection();
    	         PreparedStatement ps = con.prepareStatement(
    	             "SELECT name, email, mobile FROM customer WHERE consumerId = ?")) {
    	        ps.setString(1, newData.getConsumerId());
    	        ResultSet rs = ps.executeQuery();
    	        if (rs.next()) {
    	            return newData.getName().equals(rs.getString("name")) &&
    	                   newData.getEmail().equals(rs.getString("email")) &&
    	                   newData.getMobile().equals(rs.getString("mobile"));
    	        }
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    return false;
    	}
    	public boolean updateLoginStatus(String email, String status) {
    	    new DbUtility();
			try (Connection con = DbUtility.createConnection();
    	         PreparedStatement ps = con.prepareStatement("UPDATE login SET status=? WHERE email=?")) {
    	        ps.setString(1, status);
    	        ps.setString(2, email);
    	        return ps.executeUpdate() > 0;
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    return false;
    	}

    	public String saveComplaint(Complaint c) {
    	    String complaintId = null;
    	    String insertSQL = "INSERT INTO Complaint (complaintType, complaintCategory, complaintText, consumerId) " +
    	                       "VALUES (?, ?, ?, ?)";

    	    new DbUtility();
			try (Connection con = DbUtility.createConnection();
    	         PreparedStatement ps = con.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS)) {

    	        ps.setString(1, c.getType());
    	        ps.setString(2, c.getCategory());
    	        ps.setString(3, c.getText());
    	        ps.setString(4, c.getConsumerId());

    	        int rows = ps.executeUpdate();

    	        if (rows > 0) {
    	            try (ResultSet rs = ps.getGeneratedKeys()) {
    	                if (rs.next()) {
    	                    complaintId = rs.getString(1); // Auto-generated complaintId
    	                }
    	            }
    	        }

    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }

    	    return complaintId;
    	}

    	/**
    	 * @param consumerId
    	 * @return
    	 */
    	public List<Complaint> getComplaintsByConsumerId(String consumerId) {
    	    List<Complaint> list = new ArrayList<>();
    	    new DbUtility();
			try (Connection con = DbUtility.createConnection();
    	         PreparedStatement ps = con.prepareStatement("SELECT * FROM Complaint WHERE consumerId = ?")) {
    	        ps.setString(1, consumerId);
    	        ResultSet rs = ps.executeQuery();
    	        while (rs.next()) {
    	            Complaint c = new Complaint();
    	            c.setCompliantId(rs.getInt("complaintId"));
    	            c.setType(rs.getString("complaintType"));
    	            c.setCategory(rs.getString("complaintCategory"));
    	            c.setText(rs.getString("complaintText"));
    	            c.setCompliantDate(rs.getString("complaintdate"));
    	            c.setStatus(rs.getString("status"));
    	            list.add(c);
    	        }
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    return list;
    	}

    	public boolean insertBill(Bill bill) {
    	    String sql = "INSERT INTO bill (consumerId, month, units, amount, status, billDate) " +
    	                 "VALUES (?, ?, ?, ?, ?, ?)";
    	    new DbUtility();
			try (Connection con = DbUtility.createConnection();
    	         PreparedStatement ps = con.prepareStatement(sql)) {

    	        int units = bill.getUnits();

    	        //  Auto-calculate amount (example rate: 5 per unit)
    	        double ratePerUnit = 5.0;
    	        double amount = units * ratePerUnit;

    	        ps.setString(1, bill.getConsumerId());
    	        ps.setString(2, bill.getMonth());
    	        ps.setInt(3, units);
    	        ps.setDouble(4, amount); // auto calculated
    	        ps.setString(5, bill.getStatus());
    	        ps.setString(6, bill.getBillDate());

    	        int result = ps.executeUpdate();
    	        return result > 0;

    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    return false;
    	}

    	public List<Bill> getAllBillsDescending() {
    	    List<Bill> list = new ArrayList<>();
    	    new DbUtility();
			try (Connection con = DbUtility.createConnection();
    	         PreparedStatement ps = con.prepareStatement("SELECT * FROM bill ORDER BY billDate DESC")) {

    	        ResultSet rs = ps.executeQuery();
    	        while (rs.next()) {
    	            Bill b = new Bill();
    	            b.setBillNo(rs.getInt("billNo"));
    	            b.setMonth(rs.getString("month"));
    	            b.setUnits(rs.getInt("units"));
    	            b.setAmount(rs.getDouble("amount"));
    	            b.setStatus(rs.getString("status"));
    	            b.setBillDate(rs.getString("billDate"));
    	            b.setConsumerId(rs.getString("consumerId"));
    	            b.setPaymentDate(rs.getString("paymentDate"));
    	            list.add(b);
    	        }

    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    return list;
    	}

    	public List<Complaint> getAllComplaints() {
    	    List<Complaint> list = new ArrayList<>();
    	    String sql = "SELECT complaintId, consumerId, complaintText, complaintDate, status, complaintType, complaintCategory FROM complaint ORDER BY complaintDate DESC";

    	    new DbUtility();
			try (Connection con = DbUtility.createConnection();
    	         PreparedStatement ps = con.prepareStatement(sql);
    	         ResultSet rs = ps.executeQuery()) {

    	        while (rs.next()) {
    	            Complaint c = new Complaint();
    	            c.setCompliantId(rs.getInt("complaintId"));
    	            c.setConsumerId(rs.getString("consumerId"));
    	            c.setText(rs.getString("complaintText"));
    	            c.setCompliantDate(rs.getString("complaintDate")); // Will be auto-filled
    	            c.setStatus(rs.getString("status"));
    	            c.setType(rs.getString("complaintType"));
    	            c.setCategory(rs.getString("complaintCategory"));
    	            list.add(c);
    	        }

    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }

    	    return list;
    	}

    	public List<Complaint> getComplaintsByStatus(String status) {
    	    List<Complaint> list = new ArrayList<>();
    	    new DbUtility();
			try (Connection con = DbUtility.createConnection();
    	         PreparedStatement ps = con.prepareStatement("SELECT * FROM complaint WHERE status = ? ORDER BY complaintDate DESC")) {
    	        ps.setString(1, status);
    	        ResultSet rs = ps.executeQuery();
    	        while (rs.next()) {
    	            Complaint c = new Complaint();
    	            c.setCompliantId(rs.getInt("complaintId"));
    	            c.setConsumerId(rs.getString("consumerId"));
    	            c.setType(rs.getString("complaintType"));
    	            c.setCategory(rs.getString("complaintCategory"));
    	            c.setText(rs.getString("complaintText"));
    	            c.setCompliantDate(rs.getString("complaintDate"));
    	            c.setStatus(rs.getString("status"));
    	            list.add(c);
    	        }
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    return list;
    	}

    	public boolean markComplaintAsCleared(int complaintId) {
    	    new DbUtility();
			try (Connection con = DbUtility.createConnection();
    	         PreparedStatement ps = con.prepareStatement("UPDATE complaint SET status = 'Cleared' WHERE complaintId = ?")) {
    	        ps.setInt(1, complaintId);
    	        return ps.executeUpdate() > 0;
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    return false;
    	}
    	public boolean doesEmailExist(String email) {
    	    try (Connection con = DbUtility.createConnection();
    	         PreparedStatement ps = con.prepareStatement("SELECT email FROM login WHERE email = ?")) {
    	        ps.setString(1, email);
    	        ResultSet rs = ps.executeQuery();
    	        return rs.next(); // email exists if there's at least one row
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    return false;
    	}
    	public Complaint getComplaintById(String complaintId) {
    	    Complaint c = null;
    	    try (Connection con = DbUtility.createConnection()) {
    	        String sql = "SELECT * FROM complaint WHERE complaintId = ?";
    	        PreparedStatement ps = con.prepareStatement(sql);
    	        ps.setInt(1, Integer.parseInt(complaintId));
    	        ResultSet rs = ps.executeQuery();
    	        if (rs.next()) {
    	            c = new Complaint();
    	            c.setCompliantId(rs.getInt("complaintId"));
    	            c.setConsumerId(rs.getString("consumerId"));
    	            c.setText(rs.getString("complaintText"));
    	            c.setType(rs.getString("complaintType"));
    	            c.setCategory(rs.getString("complaintCategory"));

    	            Date date = rs.getDate("complaintDate");
    	            if (date != null) {
    	                c.setCompliantDate(date.toString());
    	            }

    	            c.setStatus(rs.getString("status"));
    	        }
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    return c;
    	}


}