	      #  sudo pacman -S flatpak
#        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#        sudo flatpak install flathub org.DolphinEmu.dolphin-emu -y
	echo "# Clearing old files ..."
#	sh clean.sh
	rm index.* *.zip* *.rvz* -f
        alias filterDelete='find . -type f \( -iname "*.gct" -or -iname "*.gfn" -or -iname "*.bnr" -or -iname "*.h4m" -or -iname "*.sni" -or -iname "*.gsf" -or -iname "*.zsd" -or -iname "*.thp" -or -iname "*.mpc" -or -iname "*.bmd" -or -iname "*.fpk" -or -iname "*.viv" -or -iname "*.ngc" -or -iname "*.div" -or -iname "*.vid" -or -iname "*.vp*" -or -iname "*.sp" -or -iname "*.str" -or -iname "*.mus" -or -iname "*.flo" -or -iname "*.exa" -or -iname "*.ssd" -or -iname "*.sbf" -or -iname "*.spe" -or -iname "*.dat" -or -iname "*.sdt" -or -iname "*.lmp" -or -iname "*.feb" -or -iname "*.bin" -or -iname "*.dat" -or -iname "*.obj" -or -iname "*.lfb" -or -iname "*.med" -or -iname "*.samp"  -or -iname ".bnk" -or -iname "*.dsp" -or -iname "*.gsh" -or -iname "*.fsh" -or -iname "*.vsh" -or -iname "*.big" -or -iname *.abg -or -iname "*.bad" -or -iname "*.add" -o -iname "*.adb" -o -iname "*.fs" \) -exec rm {} -f \;'
#        alias filterTextFiles='grep -Elis "__start|msl_c|MetroTRK|jsystem|#!/bin|\b[a-zA-Z]{6,}\.(cpp|hpp|a|o|c|h)\b([\"\'> \n])|text section layout" *.map *.txt *.ini *.xml *.cfg | xargs -I{} rm -f {} 2>/dev/null'
	alias filterFind='find . -type f | grep -Elvis "ppceabi|metrotrk|metrowerks|msl_c|text section layout|([a-z]|[A-Z]){5,}\.(cpp|hpp|a|o|c|h)\b$" . | xargs -I{} rm -f {}'
	alias filterExt='find . -type f ! \( -iname "*.map*" -o -iname "*.rel*" -o -iname "*.elf*" -o -iname "*.exe*" -o -iname "*.txt" -o -iname "*.dol" -o -iname "*.sym" -o -iname "*.rsym" -o -iname "*.lua" -o -iname "*.rso" -o -iname "*.csv" -o -iname "*.dlf" -o -iname "*.sh" -o -iname "*.gci" -o -iname "*.sav*" -o -iname "*.tdf" -o -iname "*.inf" -o -iname "*.bat" -o -iname "*.scc" -o -iname "*.cfg" -o -iname "*.s" -o -iname "*.c" -o -iname "*.h" -o -iname "*.cpp" -o -iname "*.hpp" -o -iname "*.o" -o -iname "*.a" -o -iname "*.flb" -o -iname "*.xml" -o -iname "*.so" -o -iname "*.dll" -o -iname "*.*log*" -o -iname "*.ini" -o -iname "*.yml" -o -iname "*.yaml" -o -iname "*.json" -or -iname "*.py" -or -iname "*.exe" -o -iname "*makefile*" -o -iname "*cmake*" -o -iname "*.sln" -o -iname "*vsproj" -o -iname "*.mak" -o -iname "*.mk" \) -exec mv {}'
        alias filterTextFiles='grep -Elvis "__start|msl_c|MetroTRK|jsystem|#!/bin|([a-z]|[A-Z]){5,}\.(cpp|hpp|a|o|c|h)\b$" *.ini *.Ini *.InI *.INI *.INi *.iNI *.iNi *.mAp *.tXt *.map *.Map *.MAP *.MAp *.MaP *.mAP *.maP *.Txt *.TXt *.TXT *.tXT *.txT *.TxT *.txt *.inf *.inF *.Inf *.INF *.InF *.INf *.iNF *.InF *.iNf *.log *.LOG *.loG *.LOg *.LoG *.lOg *.lOG *.xml *.XML *.Xml *.xML *.XMl *.XmL *.xML *.cfg *.cFg *.CFG *.CFg *.cFg *.CfG | xargs -I{} rm -f {} 2>/dev/null'
#	alias filterFind='find . -type f -exec grep -Elis "ppceabi|metrotrk|metrowerks|msl_c|text section layout|[a-zA-Z]{6,}\.(cpp|hpp|a|o|c|h)\b$" {} \; | xargs mv'
#	alias dolphinTool='flatpak run --command="dolphin-tool" --filesystem host org.DolphinEmu.dolphin-emu'
	alias dolphinTool='dolphin-tool'

        echo "# Getting index ..."
        wget -q https://myrient.erista.me/files/Redump/Nintendo%20-%20GameCube%20-%20NKit%20RVZ%20%5Bzstd-19-128k%5D/
        export link_prefix="https://myrient.erista.me/files/Redump/Nintendo%20-%20GameCube%20-%20NKit%20RVZ%20%5Bzstd-19-128k%5D"
        echo "# OK, now index for filenames, download and process everything ..."
        cat index.html | grep .zip | sed 's/\" title.*//' | sed 's/.*href=\"//' | while read -r zip_file; do
          echo ">> Fetching next game ..." && \
          wget -q --show-progress "$link_prefix/$zip_file" & PID=$! && \
#	  sleep 1 && \
	  filename=$(ls *.zip 2>/dev/null | head -n 1) && \
	  file_name="${filename%.zip}" && \
	  if [ -z "$filename" ]; then
   	    while [ -z "$filename" ]; do
#	      sleep 1
	      filename=$(ls *.zip 2>/dev/null | head -n 1) 2>/dev/null
            done;
	    file_name="${filename%.zip}";
          fi && \
          if ! [ -d "$file_name" ]; then
#	    echo "   Name: $file_name";
	    wait $!;
          else
            echo " << Found existing folder!";
	    pkill wget 1>&- 2>&-;
     	    rm "$filename";
            echo "   Continue, current size: $(du -sh .)";
            continue;
	  fi && \
          filename=$(ls *.zip | head -n 1) && \
          file_name="${filename%.zip}" && \
          mkdir "$file_name" && \
          echo " # Extracting download ..." && \
          7z x "$filename" -y -bso0 -bsp0 -bse0 && \
          rm "$filename" && \
          rvz_file=$(ls *.rvz | head -n 1) && \
          echo " # Extracting game ..." && \
          dolphinTool extract -i "$rvz_file" -o "$file_name/" -q 2>/dev/null || true && \
          rm "$rvz_file" && \
          cd "$file_name" && \
          echo " # Run filter ..." && \
          rm -rf ../tmp && \
          mkdir -p ../tmp && \
          filterExt "../tmp/" \; && \
          for i in 1 2 3 4; do
#	    echo "   DBG: Scan for archives, iteration $i: files: $(find .)" && \
#	    for possible_archive_file in $(find "$possiblePath" -type f ! -path "*/sys/*" ! -iname "*opening.*bnr*"); do
	    find "../tmp/" "." -type f | while read -r possible_archive_file; do
              sub_file_name='$(basename "$possible_archive_file" | sed "s/\.[^.]*$//")' && \
#              echo "  > Found sub-game: '$possibe_archive_file'" && \
#              mkdir "../tmp/$sub_file_name" -p && \
              mkdir "files/$sub_file_name.d" -p && \
              #echo "  # Extracting sub..." && \
              dolphinTool extract -i "$possible_archive_file" -o "files/$sub_file_name.d" -q 2>/dev/null || true && \
              wszst extract "$possible_archive_file" -D "files/$sub_file_name.d" -o --dec -r -i -a > /dev/null 2>&1 || true && \
	      find . -name "wszst*" -exec rm -f {} \;
              if rmdir "files/$sub_file_name.d" 2>/dev/null; then
                #echo "  ! No data found, continue";
                #rm -rf "../tmp/$sub_file_name";
                continue;
              fi && \
#	      ls "files" && ls "files/$sub_file_name.d" && \
	      rm "$possible_archive_file" && \
              echo "  # Extracted sub-archive: $possible_archive_file" #&& \
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
	     # filterExt "../../tmp/$sub_file_name/" \; && \
	      #echo "  # Post processing ..." && \
	     # filterTextFiles && \
             # filterDelete && \
	      #ignored=$(find . -type f | awk -F. '{if (NF>1) print $NF}' | sort -u | paste -sd "," - ) && \
             # cd "../../tmp/$sub_file_name" && \
             # filterFind "../../$file_name/$sub_file_name/" && \
             # cd "../../$file_name" && \
              #if rmdir "../tmp/$sub_file_name" 2>/dev/null; then
              #  echo "  ! No code data found, continuing";
              #  continue;
              #fi && \
              #echo "  < Finished '$file_name/$sub_file_name'" && \
              #echo "    Ignored:" && \
              #echo "$ignored" && \
              #echo "    Found:" && \
              #ls "../tmp/$sub_file_name" -m && \
            done;
	  done && \
          filterTextFiles && \
          filterDelete && \
	  cd "../tmp/" && \
	  echo " # Post-Processing ..." && \
          filterFind "../$file_name/files/" && \
          if rmdir "../$file_name" 2>/dev/null; then
            echo " ! No code data found.";
            echo "   Continuing, current size: $(du -sh .)";
            cd ..;
            rm -rf "$file_name";
            continue;
          fi && \
          ignored=$(find . -type f | awk -F. '{if (NF>1) print $NF}' | sort -u | paste -sd "," - ) && \
	  rm -rf tmp && \
          echo "<< Finished '$file_name'" && \
          echo "   Ignored:" && \
	  echo "$ignored" && \
          cd .. && \
          echo "   Found:" && \
          ls "$file_name" -m && \
          echo " # Continuing, current size:" && \
          du -sh .
        done
        find . -type d -empty -delete
        echo "# Done! Successfully got code data from every Gamecube game."
