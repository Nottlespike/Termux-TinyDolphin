cd
echo "Welcome please choose what you want to do:"
echo "1-install a model"
echo "2-uninstall a model"
echo "h-help"
echo "enter anything else to exit"
read choice
termux-setup-storage

if [[ $choice -eq "1" ]]
     then
       echo "please select a model to install:"
       echo "1-TinyDolphin"
       read choice
       if [[ $choice -eq "1" ]] 
      then
          cd
          # update packages
          pkg update && pkg upgrade -y                                                                            
          # install necessary packages
          pkg install clang wget git cmake -y
          #cloning the github repository of llama.cpp
          git clone https://github.com/ggerganov/llama.cpp
          #download TinyDolphin model in GGUF format from HuggingFace
          wget https://huggingface.co/dagbs/TinyDolphin-2.8-1.1b-GGUF/raw/main/TinyDolphin-2.8-1.1b.Q4_K_M.gguf
          #making a shortcut script to launch tiny dolphin easily with the word chat
          cd /$PREFIX/bin
          echo 'clear' > chat
          echo 'cd' >> chat
          echo 'cd llama.cpp' >> chat
          echo './chat' >> chat
          chmod +x chat
          cd
      echo "installation complete. run chat to start the model"
      elif [[ $choice -eq "2" ]]
     then
         echo "please select a model to uninstall:"
         echo "1-TinyDolphin"
         read choice
         if [[ $choice -eq "1" ]]
          then
            # return to home directory
            cd
            # remove the llama.cpp folder
            rm -rf llama.cpp
            # remove the shortcut file
            cd /$PREFIX/bin
            rm chat
            # return to home directory
            cd
        echo "Tiny Dolphin has been removed"
      else
       echo "wrong input exiting"
      fi
    else
      echo "wrong input exiting"
    fi

elif [[ $choice -eq "2" ]]
    then
      echo "please select a model to uninstall:"
      echo "1-TinyDolphin"
      read choice 
      if [[ $choice -eq "1" ]]
      then
        # return to home directory
        cd
        # remove llama.cpp folder
        rm -rf llama.cpp
        # remove shortcut file
        cd /$PREFIX/bin
        rm chat
        # return to home directory
        cd
        echo "Tiny Dolphin has been removed. If you don't have any other models installed, please remove llama.cpp manually."
        else
         echo "wrong input exiting"
        fi

elif [[ $choice -eq "h" ]]
    then
      cd
      cd Termux-alpaca
      nano  help.txt
else   
    echo "wrong input exiting"
fi
