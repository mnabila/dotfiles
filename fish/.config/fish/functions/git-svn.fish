function git-svn --description "Download subfolder in git repository"
    set repository $argv[1]
    set subfolder $argv[2]
    if test -n $repository && test -n $subfolder
        echo "Starting clone/copy ..."
        set repo (echo $repository | sed 's/\/$\|.git$//')
        svn export "$repo/trunk/$subfolder"
    else
        echo "Use: gitsvn <repository> <subdirectory>"
    end
end
