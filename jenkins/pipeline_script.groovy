import hudson.model.*
import jenkins.model.Jenkins

// get Jenkins instance
Jenkins jenkins = Jenkins.getInstance()

// variables
def viewName = 'redcap' + params.redcap_server

echo 'viewName= ' + viewName

def viewExists = Hudson.instance.getView(viewName)

echo 'viewExists= ' + viewExists

if (viewExists == null)
{
// create the new view
    jenkins.addView(new ListView(viewName))


    def str_view = "redcap01"
    def str_search = "01"
    def str_replace = params.redcap_server

    def view = Hudson.instance.getView(str_view)

    echo 'view= ' + view

//copy all projects of a view
    for(item in view.getItems())
    {

        echo 'item.getName()= ' + item.getName()

        //create the new project name
        newName = item.getName().replace(str_search, str_replace)
        //newName = item.getName() + str_replace;

        echo 'newName= ' + newName

        // copy the job, disable and save it
        def job = Hudson.instance.copy(item, newName)



        // get the view
        myView = hudson.model.Hudson.instance.getView(viewName)

// add a job by its name
        myView.doAddJobToView(newName)







        echo 'job= ' + job

        job.disabled = true
        job.save()

        // update the workspace to avoid having two projects point to the same location
        AbstractProject project = job
        //def new_workspace = project.getCustomWorkspace().replace(str_search, str_replace)
        def new_workspace = project.getCustomWorkspace()  + str_replace

        project.setCustomWorkspace(new_workspace)
        project.save()

        println(" $item.name copied as $newName")

    } // if viewExists

}