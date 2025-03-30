      #  sudo pacman -S flatpak
#        sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#        sudo flatpak install flathub org.DolphinEmu.dolphin-emu -y

#	echo "# Clearing old diles ..."
#	sh clean.sh

        alias filterDelete='find . -type f \( -iname "*.gct" -or -iname "*.gfn" -or -iname "*.bnr" -or -iname "*.h4m" -or -iname "*.sni" -or -iname "*.gsf" -or -iname "*.zsd" -or -iname "*.thp" -or -iname "*.mpc" -or -iname "*.bmd" -or -iname "*.fpk" -or -iname "*.viv" -or -iname "*.ngc" -or -iname "*.div" -or -iname "*.vid" -or -iname "*.vp*" -or -iname "*.sp" -or -iname "*.str" -or -iname "*.mus" -or -iname "*.flo" -or -iname "*.exa" -or -iname "*.ssd" -or -iname "*.sbf" -or -iname "*.spe" -or -iname "*.dat" -or -iname "*.sdt" -or -iname "*.lmp" -or -iname "*.feb" -or -iname "*.bin" -or -iname "*.dat" -or -iname "*.obj" -or -iname "*.lfb" -or -iname "*.med" -or -iname "*.samp"  -or -iname ".bnk" -or -iname "*.dsp" \) -exec rm {} -f \;'
        alias filterTextFiles='grep -Evlis "__start|msl_c|MetroTRK|jsystem|#!/bin|\b[a-zA-Z]{6,}\.(cpp|hpp|a|o|c|h)\b|text section layout" *.map *.txt *.ini *.xml *.cfg | xargs -I{} rm -f {} 2>/dev/null'
        alias filterFind='grep -lrEis "ppceabi|metrotrk|metrowerks|msl_c|text section layout|\b[a-zA-Z]{6,}\.(cpp|hpp|a|o|c|h)\b" . | xargs -I{} mv "{}"'
#	alias dolphinTool='flatpak run --command="dolphin-tool" --filesystem host org.DolphinEmu.dolphin-emu'
	alias dolphinTool='dolphin-tool'

        echo "# Getting index ..."
        wget -q --show-progress https://myrient.erista.me/files/Redump/Nintendo%20-%20GameCube%20-%20NKit%20RVZ%20%5Bzstd-19-128k%5D/
        export link_prefix="https://myrient.erista.me/files/Redump/Nintendo%20-%20GameCube%20-%20NKit%20RVZ%20%5Bzstd-19-128k%5D"
        echo "# OK, now index for filenames, download and process everything ..."
        cat index.html | grep .zip | sed 's/\" title.*//' | sed 's/.*href=\"//' | while read -r zip_file; do
          echo ">> Fetching next game ..." && \
          wget -q --progress=dot "$link_prefix/$zip_file" & PID=$! && \

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
	    echo "   Name: $file_name";
	    wait $!;
          else
            echo "<< $file_name already exists, continue ...";
	    pkill wget 2>/dev/null;
     	    rm "$filename";
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
          dolphinTool extract -i "$rvz_file" -o "$file_name/" -q && \
          rm "$rvz_file" && \
          cd "$file_name" && \
          echo " # Run filter ..." && \
          rm -rf ../tmp && \
          mkdir -p ../tmp && \
#          find . -type f -iname "*debug*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.map*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.rel*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.elf*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.txt*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.dol*" -exec mv "{}" "../tmp/" \; && \
#          find . -type f -iname "*.ini*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.sym*" -exec mv "{}" "../tmp/" \; && \
#          find . -type f -iname "main.*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.flb" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.rsym*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.lua*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.rso*" -exec mv "{}" "../tmp/" \; && \
#	  find . -type f -iname "*.scc" -exec mv "{}" "../tmp/" \; && \
#          find . -type f -iname "*.cfg*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.csv*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.gci*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.tdf" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.sav*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.div" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.sh" -exec mv "{}" "../tmp" \; && \
          find . -type f -iname "*.bat" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.dlf" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.sh" -exec mv "{}" "../tmp/" \; && \
#          find . -type f -iname "*.inf" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.xml*" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.s" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.a" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.c" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.h" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.cpp" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.hpp" -exec mv "{}" "../tmp/" \; && \
          find . -type f -iname "*.o" -exec mv "{}" "../tmp/" \; && \
#          find . -type f -iname "*.*log*" -exec mv "{}" "../tmp/" \; && \
          find . -type f \( -iname *.iso -or -iname *.gcm -or -iname *.tgc \) | while read -r possible_archive_file; do
              sub_file_name=$(basename "$possible_archive_file" | sed 's/\.[^.]*$//') && \
              echo "  > Found sub-game: '$file_name/$sub_file_name'" && \
              mkdir "../tmp/$sub_file_name" -p && \
              mkdir "$sub_file_name" -p && \
              echo "  # Extracting sub..." && \
              dolphinTool extract -i "$possible_archive_file" -o "$sub_file_name" -q > nul && \
              rm "$possible_archive_file" && \
              if [ -z "$(ls -A "$sub_file_name/")" ]; then
                echo "  ! No data found, continue";
                rm -rf "$sub_file_name";
                rm -rf "../tmp/$sub_file_name";
                continue; 
              fi && \
              echo "  # Run filter..." && \
              find "$sub_file_name" -type f -iname "*debug*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.map*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.rel*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.elf*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.txt*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.dol*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.sym*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.rsym*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "main.*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.lua*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.rso*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.csv*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.dlf" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
	      find "$sub_file_name" -type f -iname "*.sh" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.gci*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.sav*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.tdf" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.inf" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.bat" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
	      find "$sub_file_name" -type f -iname "*.scc" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.cfg*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.sh" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.s" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.c" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.flb" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.a" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.cpp" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.h" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.hpp" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.o" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.xml*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
 #             find "$sub_file_name" -type f -iname "*.*log*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \
              find "$sub_file_name" -type f -iname "*.ini*" -exec mv "{}" "../tmp/$sub_file_name/" \; && \

	      echo "  # Post processing ..." && \

	      filrerFind "../tmp/$sub_file_name/" && \

	      ignored=$(find "$sub_file_name" -type f | awk -F. '{if (NF>1) print $NF}' | sort -u | paste -sd "," - ) && \

              cd "../tmp/$sub_file_name" && \
              filterTextFiles && \
              filterDelete && \
              cd "../$file_name" && \
              rm -rf "$sub_file_name" && \
              if [ -z "$(ls -A "../tmp/$sub_file_name")" ]; then
                echo "  ! No code data found, continuing";
                rmdir "../tmp/$sub_file_name";
                continue;
              fi && \

              echo "  < Finished '$file_name/$sub_file_name'" && \
              echo "    Ignored:" && \
              echo $ignored && \
              echo "    Found:" && \
              ls ../tmp/$sub_file_name -m
          done && \

	  echo " # Post processing ..." && \

          filterFind "../tmp/" && \

          if [ -z "$(ls -A ../tmp/)" ]; then 
            echo " !  No code data found, continue";
            rm -rf ../tmp/*;
            cd ..;
            rm -rf "$file_name";
            continue;
          fi && \

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
