function MACROS(){
#macro FRAME_RATE 30
#macro TILE_SIZE 8
#macro CARDINAL_DIR round(direction/90)


#macro VIEW view_camera[0]

//OS VERSIONS
#macro MACOS10_11 167817216
#macro MACOS10_12 167821312
#macro MACOS10_13 167825408
#macro MACOS10_14 167829504
#macro MACOS10_15 167833600

#macro WINDOWS7 393217
#macro WINDOWS8 393218
#macro WINDOWS8_1 393219
#macro WINDOWS10 655360

//color macros
#macro white_col #FFF4B0
#macro orange_col #FC8E26
#macro darkbrown_col #390C14


#region spark state constants (for conditionals)
	
	#macro SPARK_STATE_SAFE SparkStateSafe
	#macro SPARK_STATE_OPEN SparkStateOpen
	#macro SPARK_STATE_ATTACK SparkStateAttack
	#macro SPARK_STATE_RUNAWAY SparkStateRunAway
	#macro SPARK_STATE_BOUNCE SparkStateBounce
	#macro SPARK_STATE_TIRED SparkStateTired
	#macro SPARK_STATE_LOCKED SparkStateLocked
	#macro SPARK_STATE_BEINGATTACKED SparkStateBeingAttacked
	#macro SPARK_STATE_SLEEP SparkStateSleep
	#macro SPARK_STATE_SAFE_IDLE SparkStateSafeIdle
	
#endregion

#region big spark boss state constants (for conditionals)
	
	#macro BIGSPARK_STATE_ATK_ZOOM BigSparkStateAtk_Zoom
	#macro BIGSPARK_STATE_ATK_BURP BigSparkStateAtk_Burp
	#macro BIGSPARK_STATE_ATK_DVD BigSparkStateAtk_DVD
	#macro BIGSPARK_STATE_ATTACK BigSparkStateAttack
	#macro BIGSPARK_STATE_IDLE BigSparkStateIdle
	#macro BIGSPARK_STATE_LAUGH BigSparkStateLaugh
	#macro BIGSPARK_STATE_SPAWN BigSparkStateSpawn
	#macro BIGSPARK_STATE_GOTOCENTER BigSparkStateGoToCenter
	
#endregion

}