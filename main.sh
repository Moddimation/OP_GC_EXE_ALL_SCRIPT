      #  sudo pacman -S flatpak
#        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#        sudo flatpak install flathub org.DolphinEmu.dolphin-emu -y
	echo "# Clearing old files ..."
#	sh clean.sh
	rm index.* *.zip* *.rvz* -f
        alias filterDelete='find . -type f \( -iname "*.gct" -or -iname "*.gfn" -or -iname "*.bnr" -or -iname "*.h4m" -or -iname "*.sni" -or -iname "*.gsf" -or -iname "*.zsd" -or -iname "*.thp" -or -iname "*.mpc" -or -iname "*.bmd" -or -iname "*.fpk" -or -iname "*.viv" -or -iname "*.ngc" -or -iname "*.div" -or -iname "*.vid" -or -iname "*.vp*" -or -iname "*.sp" -or -iname "*.str" -or -iname "*.mus" -or -iname "*.flo" -or -iname "*.exa" -or -iname "*.ssd" -or -iname "*.sbf" -or -iname "*.spe" -or -iname "*.dat" -or -iname "*.sdt" -or -iname "*.lmp" -or -iname "*.feb" -or -iname "*.bin" -or -iname "*.dat" -or -iname "*.obj" -or -iname "*.lfb" -or -iname "*.med" -or -iname "*.samp"  -or -iname ".bnk" -or -iname "*.dsp" -or -iname "*.gsh" -or -iname "*.fsh" -or -iname "*.vsh" -or -iname "*.big" -or -iname *.abg -or -iname "*.bad" -or -iname "*.add" -o -iname "*.adb" -o -iname "*.fs" \) -exec rm {} -f \;'
#        alias filterTextFiles='grep -Elis "__start|msl_c|MetroTRK|jsystem|#!/bin|\b[a-zA-Z]{6,}\.(cpp|hpp|a|o|c|h)\b([\"\'> \n])|text section layout" *.map *.txt *.ini *.xml *.cfg | xargs -I{} rm -f {} 2>/dev/null'
        alias filterFind='grep -Elris "ppceabi|metrotrk|metrowerks|msl_c|text section layout|([a-z]|[A-Z]){5,}\.(cpp|hpp|a|o|c|h)\b$" . | xargs -I{} mv "{}"'
	alias filterExt='find . -type f \( -iname "*.map*" -o -iname "*.rel*" -o -iname "*.elf*" -o -iname "*.exe*" -o -iname "*.txt" -o -iname "*.dol" -o -iname "*.sym" -o -iname "*.rsym" -o -iname "*.lua" -o -iname "*.rso" -o -iname "*.csv" -o -iname "*.dlf" -o -iname "*.sh" -o -iname "*.gci" -o -iname "*.sav*" -o -iname "*.tdf" -o -iname "*.inf" -o -iname "*.bat" -o -iname "*.scc" -o -iname "*.cfg" -o -iname "*.s" -o -iname "*.c" -o -iname "*.h" -o -iname "*.cpp" -o -iname "*.hpp" -o -iname "*.o" -o -iname "*.a" -o -iname "*.flb" -o -iname "*.xml" -o -iname "*.so" -o -iname "*.dll" -o -iname "*.*log*" -o -iname "*.ini" -o -iname "*.yml" -o -iname "*.yaml" -o -iname "*.json" -or -iname "*.py" -or -iname "*.exe" -o -iname "*makefile*" -o -iname "*cmake*" -o -iname "*.sln" -o -iname "*vsproj" -o -iname "*.mak" -o -iname "*.mk" \) -exec mv {}'
        alias filterTextFiles='grep -Elisv "__start|msl_c|MetroTRK|jsystem|#!/bin|([a-z]|[A-Z]){5,}\.(cpp|hpp|a|o|c|h)\b$" *.ini *.Ini *.InI *.INI *.INi *.iNI *.iNi *.mAp *.tXt *.map *.Map *.MAP *.MAp *.MaP *.mAP *.maP *.Txt *.TXt *.TXT *.tXT *.txT *.TxT *.txt *.inf *.inF *.Inf *.INF *.InF *.INf *.iNF *.InF *.iNf *.log *.LOG *.loG *.LOg *.LoG *.lOg *.lOG *.xml *.XML *.Xml *.xML *.XMl *.XmL *.xML *.cfg *.cFg *.CFG *.CFg *.cFg *.CfG | xargs -I{} rm -f {} 2>/dev/null'
#	alias filterFind='find . -type f -exec grep -Elis "ppceabi|metrotrk|metrowerks|msl_c|text section layout|[a-zA-Z]{6,}\.(cpp|hpp|a|o|c|h)\b$" {} \; | xargs -I{} mv "{}"'
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
            echo "<< $file_name already exists!";
	    pkill wget 2>/dev/null;
     	    rm "$filename";
            echo "   Continue, current size:";
            du -sh .;
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
          dolphinTool extract -i "$rvz_file" -o "$file_name/" -q || true && \
          rm "$rvz_file" && \
          cd "$file_name" && \
          echo " # Run filter ..." && \
          rm -rf ../tmp && \
          mkdir -p ../tmp && \
          filterExt "../tmp/" \; && \
          find . -type f \( -iname *.iso -or -iname *.gcm -or -iname *.tgc \) | while read -r possible_archive_file; do
              sub_file_name=$(basename "$possible_archive_file" | sed 's/\.[^.]*$//') && \
              echo "  > Found sub-game: '$file_name/$sub_file_name'" && \
              mkdir "../tmp/$sub_file_name" -p && \
              mkdir "$sub_file_name" -p && \
              echo "  # Extracting sub..." && \
              dolphinTool extract -i "$possible_archive_file" -o "$sub_file_name" -q || true && \
              rm "$possible_archive_file" && \
              if ! rmdir --ignore-fail-on-non-empty '$sub_file_name'; then
                echo "  ! No data found, continue";
                rm -rf "../tmp/$sub_file_name";
                continue;
              fi && \
              echo "  # Run filter..." && \
              cd "$sub_file_name" && \
              find . -type f -exec sh -c '
		possible_sub_archive=$(basename "$1")
		mkdir $possible_sub_archive
		dolphinTool extract -i "$1" -o "$possible_sub_archive" -q || true \;
                isArchive=$(rmdir "$possible_sub_archive")
      		if rmdir --ignore-fail-on-non-empty "$possible_sub_archive"; then
		  rm "$1" -f
		fi
	      ' _ {} \; && \
	      filterExt "../../tmp/$sub_file_name/" \; && \
	      echo "  # Post processing ..." && \
	      filterFind "../../tmp/$sub_file_name/" && \
	      ignored=$(find . -type f | awk -F. '{if (NF>1) print $NF}' | sort -u | paste -sd "," - ) && \
              cd "../../tmp/$sub_file_name" && \
              filterTextFiles && \
              filterDelete && \
              cd "../../$file_name" && \
              rm -rf "$sub_file_name" && \
              if ! rmdir --ignore-fail-on-non-empty "../tmp/$sub_file_name"; then
                echo "  ! No code data found, continuing";
                continue;
              fi && \
              echo "  < Finished '$file_name/$sub_file_name'" && \
              echo "    Ignored:" && \
              echo $ignored && \
              echo "    Found:" && \
              ls "../tmp/$sub_file_name" -m
          done && \
          filterFind "../tmp/" && \
          if ! rmdir --ignore-fail-on-non-empty "../tmp/"; then 
            echo " ! No code data found.";
            echo "   Continuing, current size:";
            du -sh .;
            cd ..;
            rm -rf "$file_name";
            continue;
          fi && \
	  echo " # Post-Processing ..." && \
          ignored=$(find . -type f | awk -F. '{if (NF>1) print $NF}' | sort -u | paste -sd "," - ) && \
          rm -rf ./* && \
          cd ../tmp && \
          rm -f *lang* *locale* *CONTENT* && \
          filterTextFiles && \
          filterDelete && \
          ls | xargs -I{} mv "{}" "../$file_name" && \
          rm -rf "./*" && \
          echo "<< Finished '$file_name'" && \
          echo "   Ignored:" && \
	  echo $ignored && \
          cd .. && \
          echo "   Found:" && \
          ls "$file_name" -m && \
          echo " # Continuing, current size:" && \
          du -sh .
        done
        find . -type d -empty -delete
        echo "# Done! Successfully got code data from every Gamecube game."
