#!/bin/sh
	      #  sudo pacman -S flatpak
#        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#        sudo flatpak install flathub org.DolphinEmu.dolphin-emu -y
	echo "# Clearing old files ..."
#	sh clean.sh
	rm index.* *.zip* *.rvz* -f
	rm -rf tmp
        alias filterDelete='find . -type f \(-iname "*.gma" -o -iname "*.vtx" -o -iname "*.*gfx*" -o -iname "*.gcp" -o -iname "*.lfh" -o -iname "*.lfa" -o -iname "*.lfg" -o -iname "*.bnk" -o -iname "*.dtm" -o -iname "*anim*" -o -iname "*.tga" -o -iname "*.shf" -o -iname "*.shg" -o -iname "*.gct" -o -iname "*.ngc" -o -iname "*.gsf" -o -iname "*.spt" -o -iname "*.loc" -o -iname "*.gdf" -o -iname "*.tex" -o -iname "*.bmd" -o -iname "*.*pcm*" -o -iname "*.mid" -o -iname "*.dsp" -o -iname "vssver.scc" -o -iname "*.gct" -or -iname "*.gfn" -or -iname "*.bnr" -or -iname "*.h4m" -or -iname "*.sni" -or -iname "*.gsf" -or -iname "*.zsd" -or -iname "*.thp" -or -iname "*.mpc" -or -iname "*.bmd" -or -iname "*.fpk" -or -iname "*.viv" -or -iname "*.ngc" -or -iname "*.div" -or -iname "*.vid" -or -iname "*.vp*" -or -iname "*.sp" -or -iname "*.str" -or -iname "*.mus" -or -iname "*.flo" -or -iname "*.exa" -or -iname "*.ssd" -or -iname "*.sbf" -or -iname "*.spe" -or -iname "*.dat" -or -iname "*.sdt" -or -iname "*.lmp" -or -iname "*.feb" -or -iname "*.bin" -or -iname "*.dat" -or -iname "*.obj" -or -iname "*.lfb" -or -iname "*.med" -or -iname "*.samp"  -or -iname ".bnk" -or -iname "*.dsp" -or -iname "*.gsh" -or -iname "*.fsh" -or -iname "*.vsh" -or -iname "*.big" -or -iname *.abg -or -iname "*.bad" -or -iname "*.add" -o -iname "*.adb" -o -iname "*.fs" \) -delete 2>/dev/null || true'
#        alias filterTextFiles='grep -Elis "__start|msl_c|MetroTRK|jsystem|#!/bin|\b[a-zA-Z_-$@]{6,}\.(cpp|hpp|a|o|c|h)\b([\"\'> \n])|text section layout" *.map *.txt *.ini *.xml *.cfg | xargs -I{} rm -f {} 2>/dev/null'
	alias filterFind='find . -type f -exec grep -ELis "0x[0-9a-fA-F]{8,}|ppceabi|metrotrk|metrowerks|msl_c|section layout|3DPanel|.text|.data|.rodata|.sbss|.bss|([a-z_$@.-]|[A-Z_$@.-]){5,}\.(cpp|hpp|a|o|c|h)[^a-zA-Z]$" "{}" \; | xargs -I "{}" rm -f "{}" 2>/dev/null || true'
	alias filterExt='find . -type f ! \( -iname "*.dmp" -o -iname "*.fld*" -o -iname "*.run" -o -iname "*.xls*" -o -iname "*.bpr*" -o -iname "*.ddf*" -o -iname "*.mdl*" -o -iname "*.img*" -o -iname "*.map*" -o -iname "*.rel*" -o -iname "*.elf*" -o -iname "*.exe*" -o -iname "*.txt*" -o -iname "*.dol*" -o -iname "*.*sym*" -o -iname "*.lua*" -o -iname "*.rso*" -o -iname "*.csv*" -o -iname "*.dlf*" -o -iname "*.sh*" -o -iname "*.gci*" -o -iname "*.sav*" -o -iname "*.tdf*" -o -iname "*.inf*" -o -iname "*.bat*" -o -iname "*readme*" -o -iname "*.doc*" -o -iname "*.cfg*" -o -iname "*.s" -o -iname "*.s.*" -o -iname "*.c" -o -iname "*.c.*" -o -iname "*.h" -o -iname "*.h.*" -o -iname "*.cpp" -o -iname "*.hpp" -o -iname "*.o" -o -iname "*.o.*" -o -iname "*.a" -o -iname "*.a.*" -o -iname "*.flb*" -o -iname "*.xml*" -o -iname "*.so*" -o -iname "*.dll*" -o -iname "*.*log*" -o -iname "*.ini*" -o -iname "*.pdf*" -o -iname "*.yml*" -o -iname "*.yaml*" -o -iname "*.json*" -or -iname "*.py*" -or -iname "*.exe*" -o -iname "*makefile*" -o -iname "*cmake*" -o -iname "*.sln*" -o -iname "*vsproj*" -o -iname "*.mak" -o -iname "*.mk" \) -exec mv "{}"'
	alias filterTextFiles='find . -type f \( -iname "*.csv" -o -iname "*.txt" -o -iname "*.log" -o -iname "*.cfg" -o -iname "*.xml" -o -iname "*.ini" -o -iname "*.inf" -o -iname "*.map" \)  -exec grep -ELis "__start|msl_c|MetroTRK|jsystem|([a-z_.-]|[A-Z_.-]){6,}\.(cpp|hpp|a|o|c|h)[^a-zA-Z]$|section layout|\.text|.rodata|.bss|.sbss" "{}" \; | xargs -I "{}" rm -f "{}" 2>/dev/null || true'
#        alias filterTextFiles='find . -type f -exec grep -ELis "0x[0-9a-fA-F]{8,}|__start|msl_c|MetroTRK|jsystem|#!/bin|([a-z_.-]|[A-Z_.-]){6,}\.(cpp|hpp|a|o|c|h)[^a-zA-Z]$|section layout|.text" --binary-files=text -a {} \; | xargs -I{} rm -f {}'
#  	 alias filterFind='find . -type f -exec grep -Elis "ppceabi|metrotrk|metrowerks|msl_c|text section layout|[a-zA-Z_-$@]{6,}\.(cpp|hpp|a|o|c|h)\b$" {} \; | xargs mv'
# 	 alias dolphinTool='flatpak run --command="dolphin-tool" --filesystem host org.DolphinEmu.dolphin-emu'
	alias dolphinTool='dolphin-tool'
        export link="https://myrient.erista.me/files/Redump/Nintendo%20-%20GameCube%20-%20NKit%20RVZ%20%5Bzstd-19-128k%5D"

	echo "# Getting index ..."
	wget -q "$link/"
	echo "# OK, now index for filenames, download and process everything ..."
        cat index.html | grep .zip | sed 's/\" title.*//' | sed 's/.*href=\"//' | while read -r zip_file; do
	  if [[ "$zip_file" == *"Action"*"Replay"* ]]; then
	    continue;
	  fi

          echo ">> Fetching next game ..." && \
          wget -q --show-progress --progress=bar:giga "$link/$zip_file" & PID=$! && \
	  filename=$(ls *.zip 2>/dev/null | head -n 1) && \
	  file_name="${filename%.zip}" && \
	  if [ -z "$filename" ]; then
   	    while [ -z "$filename" ]; do
	      filename=$(ls *.zip 2>/dev/null | head -n 1) 2>/dev/null
            done;
	    file_name="${filename%.zip}";
          fi && \
          if ! [ -d "$file_name" ]; then
#	    echo "   Name: $file_name";
	    wait $!;
          else
            echo "<< Found existing folder!";
	    pkill wget 1>&- 2>&-;
     	    rm "$filename";
            echo "   Continuing, size: $(du -sh "$file_name" | awk '{print $1}') / $(du -sh . | awk '{print $1}')";
            continue;
	  fi && \
    	  if [ -d "$file_name" ]; then
	    echo " # NVM, exists, skipping.";
	    rm "$filename";
	    continue;
	  fi
          mkdir "$file_name" && \
          echo " # Extracting download ..." && \
          7z x "$filename" -y -bso0 -bsp0 -bse0 && \
          rm "$filename" && \
          rvz_file=$(ls *.rvz | head -n 1) && \
          echo " # Extracting game ..." && \
          dolphinTool extract -i "$rvz_file" -o "$file_name/" -q 2>/dev/null || true && \
          rm "$rvz_file" && \
          echo " # Run filter ..." && \
	  echo "  # Scan for sub archives ..." && \

          rm -rf tmp && \
          mkdir -p tmp && \
          for i in 1 2 3; do
	    filterDelete && \
	    filterTextFiles && \
	    echo "   # Scan iteration $i" && \
# 
	    find "$file_name" -type f \
	! \( -ipath "*stream*" -o -ipath "*aud*" -o -ipath "*vid*" -o -ipath "*mus*" -o -ipath "*data/*" -o -ipath "*/data*" -o -ipath "*level*" -o -ipath "*lvl*" -o -ipath "*course*" -o -ipath "*/sys/*" -o -ipath "*obj*" -o -ipath "*snd*" -o -ipath "*sound*" -o -ipath "*spr*" \) \
	! \( -name "FILE_*" -o -iname "boot.bin" -o -iname "*.inf" -o -iname "*.ini" -o -iname "*.txt" -o -iname "*.rel" -o -iname "*.h" -o -iname "*.ini" -iname "*level*" -o -iname "*.thp" -o -iname "*lvl" -o -iname "*.stf" -o -iname "*.tsc" -o -iname "*.ani" -o -iname "*.col" -o -iname "*scb" -o -iname "*.adp" -o -iname "*.all" -o -iname "*.geo" -o -iname "vssver.scc" -o -iname "*.lvl" -o -iname "*opening.bnr" -o -iname "*.tpl" -o -iname "*.mtl"  -o -iname "*.bat" -o -iname "*.map" -o -iname "*.dll" -o -iname "*.exe" -o -iname "*.img" -o -iname "*.txt" -o -iname "*.csv" -o -iname "*.elf" -o -iname "*.dol" -o -iname "boot.bin" \) \
	| while read -r possible_archive_file; do
              sub_file_name="$(basename "$possible_archive_file" | sed 's/\.[^.]*$//')" && \
              echo "   - Trying '$possible_archive_file' ..." && \
             # mkdir "tmp/$sub_file_name" -p && \
              mkdir "$file_name/files/$sub_file_name.d" -p && \
             # echo "   # Extracting sub..." && \
              dolphinTool extract -i "$possible_archive_file" -o "$file_name/files/$sub_file_name.d" 2>/dev/null || true && \
#              wszst extract "$possible_archive_file" -o -r -i -p > /dev/null 2>&1 || true && \
		dec_file="tmp/CURRENT_POSSIBLE_ARCHIVE" && \
		extracted_dir="$file_name/files/$sub_file_name.d" && \
		rm -f "$dec_file" 2>/dev/null || true && \
		dtk yay0 decompress "$possible_archive_file" -o "$dec_file" > /dev/null 2>&1 || true && \
		dtk nlzss decompress "$possible_archive_file" -o "$dec_file" > /dev/null 2>&1 || true && \
		dtk yaz0 decompress "$possible_archive_file" -o "$dec_file" > /dev/null 2>&1 || true && \
		cp -f "$dec_file" "$possible_archive_file" 2>/dev/null || true && \
		dtk rarc extract "$possible_archive_file" -o "$extracted_dir" > /dev/null 2>&1 || true && \
		dtk u8 extract "$possible_archive_file" -o "$extracted_dir" > /dev/null 2>&1 || true && \
		dtk wad extract "$possible_archive_file" -o "$extracted_dir" > /dev/null 2>&1 || true && \
	      #find "$file_name" -name "wszst-setup.txt" -type f -delete 2>/dev/null || true && \
	      if [ -z  "$(ls -A "$extracted_dir")" ] ; then
       #         echo "   ! No data found, continue";
                rmdir "$extracted_dir";
		mv "filename.szs" "${filename%.szs}" > /dev/null 2>&1;
                continue;
              fi && \
	      ls "$extracted_dir" && \
	      rm "$possible_archive_file" && \
              echo "   # Extracted sub-archive: $possible_archive_file" # && \
	#      echo "    Extracting recursively ..." && \
        #      cd "$sub_file_name" && \
        #      find . -type f ! -path "*/sys/*" ! -iname "*opening.*bnr*" -exec sh -c '
	#	shopt -s extglob
	#	possible_sub_archive="${1##*/}"
	#	possible_sub_archive_name="${possible_sub_archive%.*}"
	#	shopt -u extglob
	#	mkdir "$possible_sub_archive_name.d"
	#	#echo "    DBG: Extract $1 to $possible_sub_archive_name.d"
	#	dolphin-tool extract -i "$1" -o "$possible_sub_archive_name.d" -q 2>/dev/null || true
	#	wszst extract -o -r --dec -i -a "$1" > /dev/null 2>&1 || true
	#	find . -name "wszst*" -exec rm -f {} 2>/dev/null \;
      	#	ls "$possible_sub_archive_name.d"
	#	if ! rmdir "$possible_sub_archive_name.d" 2>/dev/null ; then
	#	  rm -f "$1" 2>/dev/null
	#	  #echo "   DBG: deleted $1"
	#	  ls "$possible_sub_archive_name.d"
#	#	else
	#	  #echo "   DBG: is empty: $possible_sub_archive_name.d from $1"
	#	fi
	#      ' _ {} \; && \
#	      cd "$sub_file_name.d" && \
#	      echo "  # Run Filter ..." && \
#	      filterExt "../../tmp/$sub_file_name/" \; && \
#	      echo "  # Post processing ..." && \
#	      filterTextFiles && \
 #             filterDelete && \
#	  #    ignored=$(find . -type f | awk -F. '{if (NF>1) print $NF}' | sort -u | paste -sd "," - ) && \
 #             cd "../../tmp/$sub_file_name" && \
  #            filterFind "../../$file_name/$sub_file_name.d/" && \
#	      ignored=$(find . -type f | awk -F. '{if (NF>1) print $NF}' | sort -u | paste -sd "," - ) && \
 #             cd "../../$file_name" && \
  #            if rmdir "../tmp/$sub_file_name" 2>/dev/null; then
   #             echo "  ! No code data found, continuing";
    #            continue;
     #         fi && \
      #        echo "  < Finished '$file_name/$sub_file_name'" && \
       #       echo "    Ignored:" && \
        #      echo "$ignored" && \
         #     echo "    Found:" && \
          #    ls "$sub_file_name.d" -m 
            done;
	  done && \

	  cd "$file_name" && \

	  echo "  # Cutting files ..." && \

	  filterExt "../tmp/" \; && \
          filterTextFiles && \
	  cd "../tmp/" && \
	  echo " # Post-Processing ..." && \
          filterFind "../$file_name/files/" && \
	  filterTextFiles && \
	  find "../$file_name" -empty -delete && \
          if rmdir "../$file_name" 2>/dev/null; then
            echo " ! No code data found.";
            echo "   Continuing, all size: $(du -sh . | awk '{print $1}')";
            cd ..;
            rm -rf "$file_name";
            continue;
          fi && \
          ignored=$(find . -type f | awk -F. '{if (NF>1) print $NF}' | sort -u | paste -sd "," - ) && \
	  cd ".." && \
	  rm -rf tmp && \
          echo "<< Finished '$file_name'" && \
          echo "   Ignored:" && \
	  echo "$ignored" && \
          echo "   Found:" && \
          find "$file_name" -type f && \
          echo " # Continuing, size: $(du -sh "$file_name" | awk '{print $1}') / $(du -sh . | awk '{print $1}')"
        done
        find . -type d -empty -delete
        echo "# Done! Successfully got code data from every Gamecube game."
	./run.sh
