import * as gulp from 'gulp';
import * as gulpPbo from 'gulp-armapbo';
import * as del from 'del';
import * as fs from 'fs'

const getDirectories = (source: string) => fs.readdirSync(source, { withFileTypes: true }).filter(item => item.isDirectory()).map(item => item.name);
const templateDirectories = getDirectories('../templates');

gulp.task('clean', cb => {
    del.sync(['../artifacts/**'], { force: true });
    cb();
});

gulp.task('copy-missions', () => {
    return gulp.src('../templates/**/*')
        .pipe(gulp.dest('../artifacts'));
});

gulp.task('copy-scripts', () => {
    var stream = gulp.src('../src/**/*');
    templateDirectories.forEach(folder => stream = stream.pipe(gulp.dest(`../artifacts/${folder}/`)));
    return stream;
});

templateDirectories.forEach(folder => {
    gulp.task(folder, () => {
        return gulp.src(`../artifacts/${folder}/**/*`)
            .pipe(gulpPbo.pack({
                fileName: `${folder}.pbo`,
                compress: [
                    '**/*.sqf',
                    'mission.sqm',
                    'description.ext'
                ],
                verbose: false
            }))
            .pipe(gulp.dest('../artifacts'));
    });
});

gulp.task('default', gulp.series('clean', 'copy-missions', 'copy-scripts', ...templateDirectories));