source_repo_name=$1
destination_repo_name=$2

origin="sombe git account"

cd ..
cd ${source_repo_name}

push_branch() {
	echo ${1}
	git checkout $1
	git pull -r
	git fetch --tags
	git tag
	git branch -a
	git remote rm origin
	git remote add origin ${origin}/${destination_repo_name}.git
	git push origin --all
	git push --tags
}

push_branch master
has_develop=$(git branch -a | grep develop)

if [[ ! -z ${has_develop} ]] 
then 
  	push_branch develop
fi
