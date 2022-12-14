package notebook;

public class Address {
	private String streetName;
	private String streetNumber;
	private String city;
	private String state;
	private String zipCode;
	private String country;
	
	public Address() {}
	
	public Address(String streetName, String streetNumber, String city, String state, String zipCode, String country) {
		this.streetName = streetName;
		this.streetNumber = streetNumber;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.country = country;
	}
	public String getStreetName() {
		return streetName;
	}
	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}
	public String getStreetNumber() {
		return streetNumber;
	}
	public void setStreetNumber(String streetNumber) {
		this.streetNumber = streetNumber;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
}
