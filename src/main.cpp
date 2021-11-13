#include <QApplication>
#include <QtWidgets>
#include <QtOpenGL>

int main(int argc, char* argv[])
{
	QApplication app(argc, argv);

	QGraphicsScene scene;
	QGraphicsView view;
	view.setViewport(new QGLWidget(QGLFormat(QGL::SampleBuffers)));
	view.setScene(&scene);
	view.setWindowTitle(QApplication::translate("simpleanchorlayout", "Simple Anchor Layout"));
	view.setDragMode(QGraphicsView::RubberBandDrag);

	QGraphicsRectItem *item1 = new QGraphicsRectItem(0, 0, 100, 100);
	item1->setBrush(QBrush(Qt::red));
	item1->setFlag(QGraphicsItem::ItemIsMovable);
	item1->setFlag(QGraphicsItem::ItemIsSelectable);

	QImage image("/home/jeff/Downloads/BingWallpaper.jpg");
	QGraphicsPixmapItem *item2 = new QGraphicsPixmapItem(QPixmap::fromImage(image));

	scene.addItem(item2);
	scene.addItem(item1);

	view.resize(360, 320);
	view.show();

	return app.exec();
}