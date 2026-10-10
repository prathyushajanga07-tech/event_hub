
void main() {
  String projectName = "Event Hub";
  int eventCount = 5;

  print("Welcome to $projectName");
  print("There are $eventCount events available.");

  if (eventCount > 0) {
    print("Events are available!");
  } else {
    print("No events available.");
  }
}
