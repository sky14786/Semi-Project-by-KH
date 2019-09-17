package common.fileRename;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class BoFileRename implements FileRenamePolicy {
	
	public BoFileRename() {
		
	}
	@Override
	public File rename(File oldFile) {
		File newFile = null;
		do {
			long currentTime = System.currentTimeMillis();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum = (int)(Math.random()*1000);
			String oldName = oldFile.getName();
			String ext = "";			
			int dot = oldName.indexOf(".");
			if(dot > -1) {
				ext = oldName.substring(dot);	//확장자명
			}
			String newName = sdf.format(new Date(currentTime)) + "_"+ rndNum + ext;
			newFile = new File(oldFile.getParent(), newName);
			
			
		}while(!createNewFile(newFile));
		return newFile;	
	}
	
	private boolean createNewFile(File newFile) {
		try {
			return newFile.createNewFile();
		}catch(IOException e) {
			e.printStackTrace();
			return false;
		}
	}

	
}








