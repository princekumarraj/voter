
public class Candidate {
	private String candidate_name,party_name,symbol,profile,category;

	public Candidate(String candidate_name, String party_name, String symbol, String profile, String category) {
		super();
		this.candidate_name = candidate_name;
		this.party_name = party_name;
		this.symbol = symbol;
		this.profile = profile;
		this.category = category;
	}

	public Candidate() {
		super();
	}

	public String getCandidate_name() {
		return candidate_name;
	}

	public void setCandidate_name(String candidate_name) {
		this.candidate_name = candidate_name;
	}

	public String getParty_name() {
		return party_name;
	}

	public void setParty_name(String party_name) {
		this.party_name = party_name;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	

}
