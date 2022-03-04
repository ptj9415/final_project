package co.maeumi.prj.chatbot.service;

import edu.emory.mathcs.backport.java.util.Arrays;
import lombok.Data;

@Data
public class KeyboardVO {
	private String type;
	private String[] buttons;

	public KeyboardVO(String[] buttons) {
		this.type = "buttons";
		this.buttons = buttons;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String[] getButtons() {
		return buttons;
	}

	public void setButtons(String[] buttons) {
		this.buttons = buttons;
	}

	@Override
	public String toString() {
		return "KeyboardVO [type=" + type + ", buttons=" + Arrays.toString(buttons) + "]";
	}
}
