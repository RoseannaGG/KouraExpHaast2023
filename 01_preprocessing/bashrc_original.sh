
# source ~/.bashrc

#/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/Volumes/archive/userdata/staff_users/roseannagamlen-greene/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

source ~/.biostar.sh

export PATH="/Volumes/archive/kennylab/LocalProgrammes/FASconCAT/"

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/iqtree-1.6.12-Linux/bin/

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/trimal/source
PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder

export PATH="/Volumes/userdata/staff_users/roseannagamlen-greene/miniconda3/bin:$PATH"
export evigene=/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/evigene

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/scripts
export PATH="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/cdhit"
export PATH="/Volumes/archive/kennylab/LocalProgrammes/exonerate/exonerate-2.2.0-x86_64/bin:$PATH"



#### .bashrcqq ########

source ~/.bashrcPATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/trimal/source
PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/FASconCAT/

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/Volumes/archive/userdata/staff_users/roseannagamlen-greene/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

source ~/.biostar.sh

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/iqtree-1.6.12-Linux/bin/

PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/trimal/source
PATH=$PATH:/Volumes/archive/kennylab/LocalProgrammes/Orthofinder/OrthoFinder/orthofinder

export PATH="/Volumes/userdata/staff_users/roseannagamlen-greene/miniconda3/bin:$PATH"

export PATH="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/cdhit"
export PATH="/Volumes/archive/kennylab/LocalProgrammes/exonerate/exonerate-2.2.0-x86_64/bin:$PATH"
PATH=$PATH:/usr/bin/perl




#### ~.bashrc

PATH=$PATH:/Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba/envs/myenv/lib/python3.12/site-packages


### .bash_profile

source ~/.bashrc



######## now edited ~/.bashrc

export PATH=$PATH:/usr/bin/
export PATH="/Volumes/archive/kennylab/LocalProgrammes/exonerate/exonerate-2.2.0-x86_64/bin:$PATH"
export evigene=/Volumes/archive/kennylab/LocalProgrammes/EviGene/evigene/evigene:$PATH
export PATH="/Volumes/archive/kennylab/Roseanna/KouraHaastExperiment2023/Trimmed_reads/trinity/Evigene/cdhit:$PATH"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/Volumes/archive/userdata/staff_users/roseannagamlen-greene/bin/micromamba:$PATH';
export MAMBA_ROOT_PREFIX='/Volumes/archive/userdata/staff_users/roseannagamlen-greene/micromamba:$PATH';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<




## create bash profile

[[ -r ~/.bashrc ]] && . ~/.bashrc