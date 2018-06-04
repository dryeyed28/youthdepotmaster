package projcet;

import java.io.File;
import java.util.UUID;

import com.oreilly.servlet.multipart.FileRenamePolicy;
public class RenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File origin) {
		String oName = origin.getName();		
		int index = oName.indexOf(".");
		if( index < 0) {
			return null;
		}else {
			String fileName = 
					oName.substring(0, index);
			String ext = oName.substring(index);
			UUID uuid = UUID.randomUUID();
			String now = uuid.toString();
			String newFileName = 
					fileName+"_"+now+ext;
			File newFile = 
					new File(origin.getParent(), newFileName);
			
			origin.renameTo(newFile);
			
			return newFile; 
		}
	}
}
