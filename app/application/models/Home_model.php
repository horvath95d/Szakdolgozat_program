<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Home_model extends CI_Model {

    public function getLoginPageData(): array
    {
        $result[0] = $this->db->query("SELECT COUNT(*) FROM `school`")->row_array()['COUNT(*)'];
        $result[1] = $this->db->query("SELECT COUNT(*) FROM `teacher`")->row_array()['COUNT(*)'];
        $result[2] = $this->db->query("SELECT COUNT(*) FROM `lesson` WHERE `year` > 0 OR `year` IS NULL")->row_array()['COUNT(*)'];
        $result[3] = $this->db->query("SELECT SUM(`members`) FROM `class`")->row_array()['SUM(`members`)'];

        return $result;
    }

    public function getLessons($teacherID = '', $classID = '', $roomID = '') {

        if (!empty($classID))
            $year = (int)$this->helper_model->getClassName($classID);

        if (empty($teacherID) && empty($classID) && empty($roomID)) {
            $where = "AND `subject_id` IS NOT NULL";
        
        } elseif (empty($teacherID) && empty($classID) && ! empty($roomID)) {
            $where = "AND `lesson`.`room_id` = ".$roomID;
        
        } elseif (empty($teacherID) && ! empty($classID) && empty($roomID)) {
            $where = "AND (`lesson`.`class_id` = ".$classID." OR `lesson`.`year` = ".$year.")";
        
        } elseif (empty($teacherID) && ! empty($classID) && ! empty($roomID)) {
            $where = "AND (`lesson`.`class_id` = ".$classID." OR `lesson`.`year` = ".$year.")
                AND `lesson`.`room_id` = ".$roomID;

        } elseif ( ! empty($teacherID) && empty($classID) && empty($roomID)) {
            $where = "AND `lesson`.`teacher_id` = ".$teacherID;

        } elseif ( ! empty($teacherID) && empty($classID) && ! empty($roomID)) {
            $where = "AND `lesson`.`teacher_id` = ".$teacherID."
                AND `lesson`.`room_id` = ".$roomID;

        } elseif ( ! empty($teacherID) && ! empty($classID) && empty($roomID)) {
            $where = "AND `lesson`.`teacher_id` = ".$teacherID."
                AND (`lesson`.`class_id` = ".$classID." OR `lesson`.`year` = ".$year.")";

        } elseif ( ! empty($teacherID) && ! empty($classID) && ! empty($roomID)) {
            $where = "AND `lesson`.`teacher_id` = ".$teacherID."
                AND (`lesson`.`class_id` = ".$classID." OR `lesson`.`year` = ".$year.")
                AND `lesson`.`room_id` = ".$roomID;
        }
        //`id`, `fix_room`, `fix_time`, `day`, `time`, `lesson`.`year`,
        $query = $this->db->query("SELECT `lesson`.*,
            `short`, `color`, `subject`.`name` AS 'subject_name',
            `class`.`name` AS 'class_name',
            `teacher`.`name` AS 'teacher_name',
            `room`.`name` AS 'room_name'
            FROM `lesson`
            LEFT JOIN `subject` ON `lesson`.`subject_id` = `subject`.`id`
            LEFT JOIN `class` ON `lesson`.`class_id` = `class`.`id`
            LEFT JOIN `teacher` ON `lesson`.`teacher_id` = `teacher`.`id`
            LEFT JOIN `room` ON `lesson`.`room_id` = `room`.`id`
            WHERE `lesson`.`school_id` = ".$this->school_id."
            ".$where."
            ORDER BY `class_id`, `year`, `subject`.`name`");

        return $query->result_array();
    }

    // Operations
    public function setTime($id, $day, $time, $manual = false) {
        $fixTime = $manual && $day != 0 && $time != 0 ? 1 : 0;

        $this->db->query("UPDATE `lesson` SET `fix_time`=".$fixTime.", `day`=".$day.", `time`=".$time." WHERE `id` = ".$id);
    }

    public function setRoom($id, $roomID, $manual = false) {
        $fixRoom = $manual && $roomID != 'NULL' ? 1 : 0;

        $this->db->query("UPDATE `lesson` SET `room_id` = ".$roomID.", `fix_room` = ".$fixRoom." WHERE `id` = ".$id);
    }

    public function validate(): bool
    {
        
        $teacher = $this->db->query("SELECT `teacher_id` FROM `lesson`
            WHERE `school_id` = ".$this->school_id." AND `day` != 0 AND `time` != 0
            GROUP BY `day`, `time`, `teacher_id`
            HAVING COUNT(*) > 1")->row_array();
        
        if (!empty($teacher)) {
            $this->session->set_flashdata('message', getTeacherName($teacher['teacher_id']).' ??rarendj??ben 2 ??ra van egy id??pontra be??ll??tva!');
            return false;
        }

        $class = $this->db->query("SELECT `class_id` FROM `lesson`
            WHERE `school_id` = ".$this->school_id." AND `day` != 0 AND `time` != 0
            AND `class_id` IS NOT NULL
            GROUP BY `day`, `time`, `class_id`
            HAVING COUNT(*) > 1")->row_array();
        
        if (!empty($class)) {
            $this->session->set_flashdata('message', getClassName($class['class_id']).' ??rarendj??ben 2 ??ra van egy id??pontra be??ll??tva!');
            return false;
        }

        $year = $this->db->query("SELECT `year` FROM `lesson`
            WHERE `school_id` = ".$this->school_id." AND `day` != 0 AND `time` != 0
            AND `subject_id` IS NOT NULL AND `year` IS NOT NULL
            GROUP BY `day`, `time`, `year`
            HAVING COUNT(*) > 1")->row_array();
        
        if (!empty($year)) {
            $this->session->set_flashdata('message', $year['special'].'.??vfolyam ??rarendj??ben 2 ??ra van egy id??pontra be??ll??tva!');
            return false;
        }

        $room = $this->db->query("SELECT `room_id` FROM `lesson`
            WHERE `school_id` = ".$this->school_id." AND `day` != 0 AND `time` != 0
            AND `room_id` IS NOT NULL
            GROUP BY `day`, `time`, `room_id`
            HAVING COUNT(*) > 1")->row_array();
        
        if (!empty($room)) {
            $this->session->set_flashdata('message', getRoomName($room['room_id']).' ??rarendj??ben 2 ??ra van egy id??pontra be??ll??tva!');
            return false;
        }

        return true;
    }

    public function getFixedLesson($time, $day, $classID, $year) {
        $query = $this->db->query("SELECT * FROM `lesson`
            WHERE `day` = ".$day." AND `time` = ".$time."
            AND (`class_id` = ".$classID." OR `year` = ".$year.")");
        return  $query->row_array();
    }

    public function selectLesson($time, $day ,$classID, $year) {
        // ha ??vfolyamra vonatkoz?? ??r??t v??laszt ki, akkor le kell ellen??rizni h az eg??sz ??vfolyamnak szabad-e az az id??pont

        // SELECT azt az ??r??t, aminek a fontoss??ga a legnagyobb
        // nincs m??g id??pontja
        // szabad a tan??rja
        // szabad a terme, ha van be??ll??tva
        // ha kevesebb v egyenl?? az ??rasz??m mint a napok sz??ma, akkor az nap m??g nem volt ilyen ??ra

        // V??lasszuk ki az az ??r??t
        $query = $this->db->query("SELECT * FROM `lesson`
            WHERE `school_id`=".$this->school_id."
            AND (`class_id`=".$classID." OR `year`=".$year.") AND `day` = 0 AND `time` = 0
            AND `teacher_id` NOT IN (SELECT `teacher_id` FROM `lesson` WHERE `school_id`=".$this->school_id." AND `day`=".$day." AND `time`=".$time.")
            AND `room_id` NOT IN (SELECT `room_id` FROM `lesson` WHERE `school_id`=".$this->school_id." AND `day`=".$day." AND `time`=".$time.")
            AND `subject_id` NOT IN (SELECT `subject_id` FROM `lesson` WHERE `school_id`=".$this->school_id." AND (`class_id`=".$classID." OR `year`=".$year.") AND `day`=".$day.")");
        $lessons = $query->result_array();

        if (!empty($lessons))
            return $lessons[rand(0,count($lessons)-1)];
    }

    public function selectRoom($subjectID, $day, $time) {
        // ha csak egy terem van megadva, az legyen
        // ha az foglalt ??s m??s teremben is tarthat?? az ??ra, keressen m??st
        // m?? keres??s??kor els??nek ellen??rizze le, h lehets??ges-e az oszt??lyteremben tartani
        // amennyiben nem, azok k??z??l v??lasszon ahol nincs megadva tant??rgy
        // ha ilyen sincs a marad??kb??l v??lasszon
        // olyan oszt??ny ne ker??lj??n olyan terembe ahol a l??tsz??m nagyobb mint a teremben a f??r??helyek
        $query = $this->db->query("SELECT `room_id` FROM `room_subject`
            WHERE `subject_id`=".$subjectID."
            GROUP BY `subject_id` HAVING COUNT(*) = 1");

        if (isset($query->row_array()['room_id'])) {
            return $query->row_array()['room_id'];
        }

        $query = $this->db->query("SELECT `id` FROM `room`
            WHERE `school_id`=".$this->school_id);

        if (isset($query->result_array()[0]['id'])) {
            return $query->result_array()[rand(0, count($query->result_array()))]['id'];
        }
    }

    public function getPlace($lesson): array
    {
        // keress??nk helyet a kimaradt ??r??nak, lehet??leg ??gy, h m??sikan nem kell kivenni a hely??r??l
        // keresem azt az id??pontot ahol az oszt??ly ??s a tarn??r is szabad
        //$query = $this->db->query("SELECT");

        // ha nem l??tezik ilyen, keresem azt az id??pontot ahol a tan??r szabad

        // beteszem ezt az ??r??t oda, az el??z?? ??r??t kiveszem



        // vegy??k ki az ??sszes ??r??t ami ennek az oszt??lynak van, hol van lyuk az ??rarendj??ben?
        //$query = $this->db->query("SELECT `day`, `time` FROM");

        return [5, 7];
    }

    public function getPossibleLessons($time, $day ,$classID, $year) {
        $query = $this->db->query("SELECT * FROM `lesson`
            WHERE `school_id`=".$this->school_id."
            AND (`class_id`=".$classID." OR `year`=".$year.") AND `day` = 0 AND `time` = 0
            AND `teacher_id` NOT IN (SELECT `teacher_id` FROM `lesson` WHERE `school_id`=".$this->school_id." AND `day`=".$day." AND `time`=".$time.")
            AND `room_id` NOT IN (SELECT `room_id` FROM `lesson` WHERE `school_id`=".$this->school_id." AND `day`=".$day." AND `time`=".$time.")
            AND `subject_id` NOT IN (SELECT `subject_id` FROM `lesson` WHERE `school_id`=".$this->school_id." AND (`class_id`=".$classID." OR `year`=".$year.") AND `day`=".$day.")");
        return $query->result_array();
    }
    
    public function getTimelessLessons() {
        $query = $this->db->get_where('lesson', ['day' => 0, 'time' => 0]);
        return $query->result_array();
    }
    
    public function fixRoomsRemove() {
        $this->db->where(['school_id' => $this->school_id, 'fix_room' => 1]);
        $this->db->update('lesson', ['room_id' => NULL, 'fix_room' => 0]);
    }

    public function fixTimeRemove() {
        $this->db->where(['school_id' => $this->school_id, 'fix_time' => 1]);
        $this->db->update('lesson', ['fix_time' => 0, 'day' => 0, 'time' => 0]);
    }

    public function emptying() {
        $this->db->where(['school_id' => $this->school_id, 'fix_room' => 0]);
        $this->db->update('lesson', ['room_id' => NULL]);

        $this->db->where(['school_id' => $this->school_id, 'fix_time' => 0]);
        $this->db->update('lesson', ['day' => 0, 'time' => 0]);
    }
}
