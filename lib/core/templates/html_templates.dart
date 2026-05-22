import 'portfolio_template.dart';

final List<PortfolioTemplate> appTemplates = [
  PortfolioTemplate(
    id: 'developer_dark',
    title: 'Developer Terminal',
    type: 'Dark & Monospace',
    imageUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} - Developer</title>
    <style>
        :root { --primary: \${primaryColor}; --bg: #0f172a; --text: #f8fafc; }
        body { font-family: 'Courier New', Courier, monospace; background-color: var(--bg); color: var(--text); padding: 5%; line-height: 1.6; }
        h1 { font-size: 3rem; color: var(--primary); animation: slideIn 1s ease-out; }
        h2 { font-size: 2rem; border-bottom: 2px solid var(--primary); padding-bottom: 10px; margin-top: 40px; animation: fadeIn 1.5s ease-out; }
        p { font-size: 1.2rem; opacity: 0.8; animation: fadeIn 2s ease-out; }
        .skills span { display: inline-block; padding: 5px 10px; margin: 5px; background: rgba(255,255,255,0.1); border-left: 3px solid var(--primary); border-radius: 4px; transition: transform 0.3s; }
        .skills span:hover { transform: scale(1.1); background: var(--primary); color: var(--bg); }
        .projects { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-top: 20px; }
        .project-card { padding: 20px; background: rgba(255,255,255,0.05); border: 1px solid rgba(255,255,255,0.1); border-radius: 8px; transition: all 0.3s; }
        .project-card:hover { border-color: var(--primary); transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0,0,0,0.5); }
        .links a { display: inline-block; margin-right: 15px; color: var(--primary); text-decoration: none; font-weight: bold; transition: opacity 0.3s; }
        .links a:hover { opacity: 0.7; }
        
        @keyframes slideIn { from { transform: translateX(-50px); opacity: 0; } to { transform: translateX(0); opacity: 1; } }
        @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
    </style>
</head>
<body>
    <h1>\${name}_</h1>
    <p>\${bio}</p>
    
    <h2>> Skills</h2>
    <div class="skills">
        \${skills.split(',').map((s) => '<span>\${s.trim()}</span>').join('')}
    </div>

    <h2>> Projects</h2>
    <div class="projects">
        \${projects.split(',').map((p) => '<div class="project-card"><h3>\${p.trim()}</h3><p>Built with passion and code.</p></div>').join('')}
    </div>

    <h2>> Connect</h2>
    <div class="links">
        <a href="\${githubUrl}" target="_blank">GitHub -></a>
        <a href="\${linkedinUrl}" target="_blank">LinkedIn -></a>
    </div>
</body>
</html>
''',
  ),
  PortfolioTemplate(
    id: 'minimalist_light',
    title: 'Minimalist Clean',
    type: 'Light & Elegant',
    imageUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} - Portfolio</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;600;900&display=swap');
        :root { --primary: \${primaryColor}; --bg: #ffffff; --text: #1a1a1a; }
        body { font-family: 'Inter', sans-serif; background-color: var(--bg); color: var(--text); padding: 5% 10%; max-width: 900px; margin: auto; }
        h1 { font-size: 4rem; font-weight: 900; letter-spacing: -2px; margin-bottom: 10px; animation: slideUp 1s cubic-bezier(0.2, 0.8, 0.2, 1); }
        h1 span { color: var(--primary); }
        .bio { font-size: 1.5rem; font-weight: 300; line-height: 1.8; color: #555; animation: slideUp 1.2s cubic-bezier(0.2, 0.8, 0.2, 1); }
        
        .section { margin-top: 80px; animation: fadeIn 1.5s ease; }
        h2 { font-size: 1.2rem; text-transform: uppercase; letter-spacing: 2px; color: var(--primary); margin-bottom: 30px; }
        
        .skills-grid { display: flex; flex-wrap: wrap; gap: 10px; }
        .skill-tag { padding: 10px 20px; border-radius: 50px; background: #f0f0f0; font-weight: 600; font-size: 0.9rem; transition: all 0.3s; }
        .skill-tag:hover { background: var(--primary); color: white; transform: translateY(-3px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        
        .project-list { display: flex; flex-direction: column; gap: 30px; }
        .project-item { padding-bottom: 30px; border-bottom: 1px solid #eee; transition: padding-left 0.3s; }
        .project-item:hover { padding-left: 20px; border-color: var(--primary); }
        .project-item h3 { font-size: 1.8rem; margin: 0 0 10px 0; }
        
        .social { margin-top: 60px; padding-top: 40px; border-top: 1px solid #eee; display: flex; gap: 30px; }
        .social a { color: var(--text); text-decoration: none; font-size: 1.2rem; font-weight: 600; transition: color 0.3s; }
        .social a:hover { color: var(--primary); }
        
        @keyframes slideUp { from { transform: translateY(50px); opacity: 0; } to { transform: translateY(0); opacity: 1; } }
        @keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
    </style>
</head>
<body>
    <h1>Hello, I'm <span>\${name}</span>.</h1>
    <p class="bio">\${bio}</p>
    
    <div class="section">
        <h2>Expertise</h2>
        <div class="skills-grid">
            \${skills.split(',').map((s) => '<div class="skill-tag">\${s.trim()}</div>').join('')}
        </div>
    </div>

    <div class="section">
        <h2>Selected Work</h2>
        <div class="project-list">
            \${projects.split(',').map((p) => '<div class="project-item"><h3>\${p.trim()}</h3><p>An elegant solution built with modern tools.</p></div>').join('')}
        </div>
    </div>

    <div class="social">
        <a href="\${githubUrl}" target="_blank">GitHub</a>
        <a href="\${linkedinUrl}" target="_blank">LinkedIn</a>
    </div>
</body>
</html>
''',
  ),
  PortfolioTemplate(
    id: 'creative_glass',
    title: 'Creative Glassmorphism',
    type: 'Vibrant & Modern',
    imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>\${name} | Creative</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap');
        :root { --primary: \${primaryColor}; }
        body { font-family: 'Poppins', sans-serif; background: linear-gradient(135deg, #1a1a2e, #16213e, var(--primary)); background-size: 400% 400%; animation: gradientBG 15s ease infinite; color: white; min-height: 100vh; padding: 5%; margin: 0; display: flex; flex-direction: column; align-items: center; }
        
        .glass-card { background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(10px); -webkit-backdrop-filter: blur(10px); border-radius: 20px; border: 1px solid rgba(255, 255, 255, 0.2); padding: 40px; max-width: 800px; width: 100%; box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.3); animation: scaleUp 1s cubic-bezier(0.175, 0.885, 0.32, 1.275); }
        
        h1 { font-size: 3.5rem; margin: 0 0 10px 0; background: -webkit-linear-gradient(45deg, #fff, rgba(255,255,255,0.5)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; text-align: center; }
        .bio { font-size: 1.2rem; text-align: center; margin-bottom: 40px; color: rgba(255,255,255,0.8); }
        
        h2 { font-size: 1.5rem; margin-top: 30px; border-bottom: 1px solid rgba(255,255,255,0.2); padding-bottom: 10px; }
        
        .skills-wrap { display: flex; flex-wrap: wrap; gap: 15px; justify-content: center; }
        .skill-pill { background: rgba(255,255,255,0.15); padding: 8px 16px; border-radius: 8px; font-size: 0.9rem; font-weight: bold; transition: all 0.3s; cursor: default; }
        .skill-pill:hover { background: var(--primary); transform: translateY(-5px) scale(1.05); box-shadow: 0 10px 20px rgba(0,0,0,0.2); }
        
        .projects-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin-top: 20px; }
        .project-box { background: rgba(0,0,0,0.2); padding: 20px; border-radius: 15px; text-align: center; transition: all 0.4s; border: 1px solid transparent; }
        .project-box:hover { border-color: rgba(255,255,255,0.5); transform: translateY(-10px); background: rgba(255,255,255,0.1); }
        
        .btn-group { display: flex; justify-content: center; gap: 20px; margin-top: 50px; }
        .btn { padding: 12px 30px; border-radius: 50px; text-decoration: none; color: white; font-weight: bold; transition: all 0.3s; background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.2); }
        .btn.primary { background: var(--primary); border-color: var(--primary); }
        .btn:hover { transform: scale(1.1); box-shadow: 0 0 20px var(--primary); }
        
        @keyframes gradientBG { 0% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } 100% { background-position: 0% 50%; } }
        @keyframes scaleUp { from { transform: scale(0.9); opacity: 0; } to { transform: scale(1); opacity: 1; } }
    </style>
</head>
<body>
    <div class="glass-card">
        <h1>\${name}</h1>
        <p class="bio">\${bio}</p>
        
        <h2>Skills</h2>
        <div class="skills-wrap">
            \${skills.split(',').map((s) => '<div class="skill-pill">\${s.trim()}</div>').join('')}
        </div>
        
        <h2>Projects</h2>
        <div class="projects-grid">
            \${projects.split(',').map((p) => '<div class="project-box"><h3>\${p.trim()}</h3></div>').join('')}
        </div>
        
        <div class="btn-group">
            <a href="\${githubUrl}" class="btn primary" target="_blank">GitHub Profile</a>
            <a href="\${linkedinUrl}" class="btn" target="_blank">LinkedIn</a>
        </div>
    </div>
</body>
</html>
''',
  ),
];
