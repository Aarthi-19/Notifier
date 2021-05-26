package GetterSetter;

public class Notesviewgetset {

	private String NotesName;
	private String Email;

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getNotesName() {
		return NotesName;
	}

	public void setNotesName(String notesName) {
		NotesName = notesName;
	}
	public String toString()
	{
		return NotesName;
	}
}
