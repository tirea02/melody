/**적용되는 사이트 : melody_albumDetail, songDetail.jsp
 * 작성자 : 이유진
 */

//albumDetail.jsp	-> 별점 드래그
 const rating_input = document.querSelector('.rating input');
	const rating_star = document.querySelector('.rating_star');
	
	rating_input.addEventListener('input', () => {
		rating_star.style.width='${rating_input.value *10}%';
	});
	 
//albumDetail + songDetail.jsp	-> 좋아요 클릭 
function click_Likes(){
	const likeIcon = document.getElementById('likeIcon');
	
	const currentClass = likeIcon.className;
	
	if(currentClass === 'fa-regular fa-heart'){
		likeIcon.className = 'fa-solid fa-heart';
	}else{
		likeIcon.className = 'fa-regular fa-heart';
	}
}
