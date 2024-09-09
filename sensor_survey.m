% Mock function to simulate get_blueprint_library
function blueprints = mock_get_blueprint_library()
    % Simulating blueprints with various technologies
    blueprints = struct('id', {'sensor.camera.rgb', 'sensor.lidar.ray_cast', 'sensor.radar', 'sensor.camera.depth'});
end

% Initialize the world object
world = struct();
world.get_blueprint_library = @mock_get_blueprint_library;

% Function to survey available technologies
function survey_available_technologies(world)
    % Retrieve the blueprint library from the world object
    blueprints = world.get_blueprint_library();
    
    % Filter blueprints for cameras and sensors
    cameras = filterBlueprints(blueprints, 'camera');
    sensors = filterBlueprints(blueprints, 'sensor');
    
    % Display available cameras
    disp('Available Cameras:');
    for i = 1:length(cameras)
        disp(cameras(i).id);
    end
    
    % Display available sensors (excluding cameras)
    disp('Available Sensors:');
    for i = 1:length(sensors)
        if ~contains(sensors(i).id, 'camera')
            disp(sensors(i).id);
        end
    end
end

% Helper function to filter blueprints based on a filter string
function filtered = filterBlueprints(blueprints, filterString)
    % Filters the blueprints array for items that contain the filterString
    filtered = blueprints(contains({blueprints.id}, filterString));
end

% Test the survey_available_technologies function
survey_available_technologies(world);
