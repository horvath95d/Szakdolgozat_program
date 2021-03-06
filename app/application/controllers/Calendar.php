<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Calendar extends CI_Controller {

    public function __construct() {
        parent::__construct();

        $this->checkLoggedIn();
        $this->checkActiveAccount();

        $this->load->model('calendar_model');
        $this->lang->load(['template', 'calendar'], $this->session->userdata('language'));
    }

    public function index() {
        if (empty($_POST)) {
            $data['title'] = lang('link_calendar');
            $data['events'] = $this->calendar_model->getEvents();
            $this->render_page('calendar/index', $data);
        } else {
            $this->calendar_model->saveEvents();
            redirect('calendar');
        }
    }

    public function delete($id) {
        $this->calendar_model->deleteEvent($id);
        redirect('calendar');
    }

    public function json() {
        $data['events'] = $this->calendar_model->getEvents();
        echo json_encode($data);
    }
}
