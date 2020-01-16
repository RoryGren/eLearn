<?php

/**
 * Description of classDashboardView
 *
 * Receives data from Model via Dashboard and returns set up display
 * 
 * @author rory
 */
class classDashboardView {

	private $LastActiveRowId;
	private $LastActiveChapter;
	private $LastActiveSecCode;
	
	public function __construct() {
//		self::function();
	}

	public function leftNavMenuHeader($Data) {
//		print_r($Data);
		$Header = "<div class=\"navbar-header btn-block\">
			<button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-ex1-collapse\">
				<span class=\"sr-only\">Toggle navigation</span>
				<span class=\"icon-bar\"></span>
				<span class=\"icon-bar\"></span>
				<span class=\"icon-bar\"></span>
			</button>
			<span class=\"block navbar-brand\">" . $Data['Description'] . "</span>
		</div>";
		echo $Header;
	}
	
	public function setLastActive($LastActiveRowId, $LastActiveChapter, $LastActiveSecCode) {
		$this->LastActiveRowId   = $LastActiveRowId;
		$this->LastActiveChapter = $LastActiveChapter;
		$this->LastActiveSecCode = $LastActiveSecCode;
	}
	
	public function leftNavMenu($MenuData, $UserJSON) {
		/*
		 * Builds the chapter buttons and "container" section links for the 
		 * leftNav menu
		 * Setup constant html and initialise variables
		 * $UserJSON: Array ( [1] => Array (  [ChapterId] => 1 [SectionId] => 1 [Status] => Completed [StartDate] => 2017-11-09T11:59:25.451Z [CompleteDate] => 2017-11-09T12:00:13.968Z )... 
		 */
		$UserProgressData = $UserJSON;
		/*
		* ======================================================================
		* ========== Outer Wrapper for LeftNav =================================
		* ======================================================================
		 */
		$AccordionStart   = "<div class=\"panel-group\" id=\"accordion\">";
		$PanelWrapperTop  = "<div class=\"panel panel-default\">";
		$PanelWrapperEnd  = "</div>";
		$AccordionEnd     = "</div>";
		/*
		* ======================================================================
		* ========== Wrapper for LeftNav Chapter Buttons =======================
		* ======================================================================
		 */
		$ChContainerTop    = "<div class=\"panel-heading leftNavButton\" data-toggle=\"collapse\" data-parent=\"#accordion\" data-target=\"#";
		$DataTargetId      = ""; //collapseOne;
		$ChContainerTopEnd = "\">";

		$ChTitleH4Top      = "<h4 class=\"panel-title\"><a href=\"#";
		$ChTitleText       = ""; 
		$ChContTitleH4End  = "\"></a></h4></div>";
		/*
		* ======================================================================
		* ========== Wrapper for LeftNav Collapse Panels =======================
		* ======================================================================
		 */
		$CollapseRowStart = "<tr><td>";
		$CollapseRowEnd   = "</td></tr>";
		$CollapsePanelEnd = "</table></div></div>";
		//======================================================================
		$OldChapterId     = 0;		

		foreach ($MenuData as $Key => $ItemData) {
//			Key: 3 => Array ( 
//			[RowId] => 3 
//			[CourseId] => 1 
//			[ChapterId] => 1 
//			[ChCode] => OV 
//			[ChDescription] => OverView 
//			[SectionId] => 3 
//			[SecCode] => Login 
//			[SecDescription] => Logging In 
//			[SecGlyph] => fa fa-sign-in 
//			[SecContent] => ) 				
			// <=================================>
			// <===== Build Chapter Buttons =====>
			// <=================================>
			$StatusGlyph = "";
			$StatusClass = "class=\"text-black\"";
			if ($OldChapterId !== $ItemData['ChapterId']) {
				$ChapterId    = $ItemData['ChapterId'];
				$ChapterDesc  = $ItemData['ChDescription'];
				$DataTargetId = $ItemData['ChCode'];
				$ChapterButton[$ChapterId] = "<div class=\"panel-heading leftNavButton\" "
						. "data-toggle=\"collapse\" data-parent=\"#accordion\" "
						. "data-target=\"#$DataTargetId\" id=\"Ch-$ChapterId\" onclick=\"chapterClicked($(this).attr('id'));\">"
						. "<h4 class=\"panel-title\">"
						. "<a href=\"#$DataTargetId\">$ChapterId&nbsp;&nbsp;$ChapterDesc</a></h4>"
						. "</div>";

				$OldChapterId = $ItemData['ChapterId'];
				$CollapsePanelTop[$ChapterId] = "<div id=\"" . $DataTargetId . "\" class=\"panel-collapse collapse\">"
						. "<div class=\"panel-body\">
								<table class=\"table\">";
			}
			// <==================================>
			// <===== Build Chapter Sections =====>
			// <==================================>
			$RowId = $ItemData['RowId'];
			if ($UserProgressData[$RowId]['Status'] === "Completed") {
				$StatusClass = "class=\"text-green border-green\"";
				$StatusGlyph = "<abbr id=\"StatusGlyph-$RowId\" title=\"Completed\"><span class=\"glyphicon glyphicon-ok-circle text-green text-very-right\"></span></abbr>";
			}
			elseif ($UserProgressData[$RowId]['Status'] === "Viewed") {
				$StatusClass = "class=\"viewed\"";
				$StatusGlyph = "<abbr id=\"StatusGlyph-$RowId\" title=\"Assessment Not Completed\"><span class=\"glyphicon glyphicon-question-sign text-red text-very-right\"></span></abbr>";
			}
			 elseif ($RowId == $this->LastActiveRowId) {
				$StatusClass = "class=\"lastActive\"";
				$StatusGlyph = "<abbr id=\"StatusGlyph-$RowId\" title=\"Last Accessed - click to continue\"><span class=\"glyphicon glyphicon-road text-brown text-very-right\"></span></abbr>";
			}
			else {
				$StatusGlyph = "<abbr id=\"StatusGlyph-$RowId\" title=\"\"></abbr>";
			}
			$Sec   = $ItemData['SectionId'];
			$Section[$ChapterId][$Sec] = "<tr id='$RowId' $StatusClass><td>"
					. "<span class=\""
					. $ItemData['SecGlyph']
					. " \"></span></td><td>"
					. "<a href=\"#\" onclick=\"displayVideo($RowId);\">"
					. $ItemData['SecDescription'] 
					. "</a>"
					. "$StatusGlyph</td></tr>";
		}
		echo $AccordionStart;
		foreach ($ChapterButton as $ChapId => $Chapter) {
			echo $PanelWrapperTop;
			echo $ChapterButton[$ChapId];
			echo $CollapsePanelTop[$ChapId];
			foreach ($Section[$ChapId] as $SecId => $SecData) {
				print_r($SecData);
			}
			echo $CollapsePanelEnd;
			echo $PanelWrapperEnd;
		}
		echo $AccordionEnd;
	}
}

?>
