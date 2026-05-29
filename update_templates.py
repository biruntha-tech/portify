import sys

def update_file():
    with open('lib/core/templates/html_templates.dart', 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    # We want to keep lines up to 4347 (which is index 4347 in 0-indexed if line 1 is index 0)
    # Let's find the line that has "  PortfolioTemplate(" and id: 'zen_garden'
    zen_garden_idx = -1
    for i, line in enumerate(lines):
        if "id: 'zen_garden'," in line:
            zen_garden_idx = i - 1
            break
            
    if zen_garden_idx == -1:
        print("Could not find zen_garden template!")
        return
        
    kept_lines = lines[:zen_garden_idx]
    
    new_templates = """  PortfolioTemplate(
    id: 'zen_garden',
    title: 'Zen Garden',
    type: 'Serene & Calm',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1528722828814-77b9b83aafb2?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} | Zen</title>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,600;1,400&family=Lato:wght@300;400&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --bg: #faf9f6;
            --text: #2c2c2a;
            --accent: #d8cdb8;
        }
        body {
            font-family: 'Lato', sans-serif;
            background-color: var(--bg);
            color: var(--text);
            margin: 0; padding: 0;
            line-height: 1.8;
            overflow-x: hidden;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 5rem 2rem;
        }
        .hero {
            min-height: 80vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            position: relative;
            animation: fadeIn 2s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .accent-circle {
            position: absolute;
            width: 400px; height: 400px;
            border-radius: 50%;
            background: radial-gradient(circle, var(--accent) 0%, transparent 70%);
            top: -100px; right: -100px;
            opacity: 0.3;
            z-index: -1;
            animation: breathe 10s infinite alternate ease-in-out;
        }
        @keyframes breathe {
            0% { transform: scale(1); opacity: 0.2; }
            100% { transform: scale(1.2); opacity: 0.4; }
        }
        h1 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 5rem;
            font-weight: 300;
            margin: 0 0 1.5rem;
            color: var(--primary);
            letter-spacing: 2px;
        }
        .bio {
            font-size: 1.4rem;
            font-weight: 300;
            color: #555;
            max-width: 600px;
            margin-bottom: 3rem;
            border-left: 2px solid var(--primary);
            padding-left: 2rem;
            font-style: italic;
        }
        h2 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.5rem;
            font-weight: 400;
            margin: 4rem 0 2rem;
            position: relative;
            display: inline-block;
        }
        h2::after {
            content: '';
            position: absolute;
            bottom: -5px; left: 0;
            width: 50px; height: 1px;
            background: var(--primary);
            transition: 0.5s;
        }
        .section:hover h2::after { width: 100%; }
        
        .skills {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .skill {
            background: transparent;
            border: 1px solid var(--accent);
            padding: 8px 20px;
            border-radius: 0;
            font-size: 0.9rem;
            letter-spacing: 1px;
            transition: 0.4s;
        }
        .skill:hover {
            background: var(--primary);
            color: #fff;
            border-color: var(--primary);
        }
        
        .projects {
            display: grid;
            grid-template-columns: 1fr;
            gap: 3rem;
        }
        .project {
            position: relative;
            padding-left: 2rem;
        }
        .project::before {
            content: '';
            position: absolute;
            left: 0; top: 15px;
            width: 8px; height: 8px;
            background: var(--accent);
            border-radius: 50%;
            transition: 0.3s;
        }
        .project:hover::before {
            background: var(--primary);
            transform: scale(1.5);
        }
        .project h3 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2rem;
            font-weight: 400;
            margin: 0 0 10px;
            color: var(--primary);
        }
        
        .links {
            margin-top: 6rem;
            display: flex;
            gap: 30px;
            border-top: 1px solid var(--accent);
            padding-top: 2rem;
        }
        .links a {
            color: var(--text);
            text-decoration: none;
            font-size: 1.1rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            transition: 0.3s;
        }
        .links a:hover {
            color: var(--primary);
            letter-spacing: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="hero">
            <div class="accent-circle"></div>
            <h1>${name}</h1>
            <p class="bio">${bio}</p>
        </div>
        
        <div class="section">
            <h2>Expertise</h2>
            <div class="skills">
                \${skills.split(',').map((s) => '<div class="skill">\${s.trim()}</div>').join('')}
            </div>
        </div>
        
        <div class="section">
            <h2>Selected Works</h2>
            <div class="projects">
                \${projects.split(',').map((p) => '<div class="project"><h3>\${p.trim()}</h3><p style="color: #666;">A refined digital experience crafted with precision and care.</p></div>').join('')}
            </div>
        </div>
        
        <div class="links">
            <a href="${githubUrl}" target="_blank">GitHub</a>
            <a href="${linkedinUrl}" target="_blank">LinkedIn</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'monochrome',
    title: 'Monochrome Pro',
    type: 'High Contrast',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1512486130939-2c4f79935e4f?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} | Black & White</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@200;400;900&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg: #000;
            --text: #fff;
            --primary: \${primaryColor};
        }
        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg);
            color: var(--text);
            margin: 0; padding: 0;
            overflow-x: hidden;
        }
        .cursor-glow {
            width: 40vw; height: 40vw;
            background: radial-gradient(circle, rgba(255,255,255,0.05) 0%, transparent 70%);
            position: fixed;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 50%;
            pointer-events: none;
            z-index: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 5vw;
            position: relative;
            z-index: 10;
        }
        .reveal {
            opacity: 0;
            transform: translateY(50px);
            animation: revealUp 1s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }
        @keyframes revealUp {
            to { opacity: 1; transform: translateY(0); }
        }
        h1 {
            font-size: 12vw;
            font-weight: 900;
            line-height: 0.85;
            letter-spacing: -0.05em;
            margin: 0 0 2rem;
            text-transform: uppercase;
        }
        h1 span {
            color: transparent;
            -webkit-text-stroke: 1px rgba(255,255,255,0.3);
            display: block;
        }
        .bio {
            font-size: 2rem;
            font-weight: 200;
            line-height: 1.4;
            max-width: 800px;
            margin-bottom: 5rem;
            animation-delay: 0.2s;
        }
        h2 {
            font-size: 1.5rem;
            font-weight: 900;
            text-transform: uppercase;
            letter-spacing: 0.2em;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            padding-bottom: 1rem;
            margin-bottom: 3rem;
            color: var(--primary);
        }
        .skills-marquee {
            white-space: nowrap;
            overflow: hidden;
            margin-bottom: 6rem;
            position: relative;
        }
        .skills-track {
            display: inline-block;
            animation: marquee 20s linear infinite;
        }
        .skill-item {
            font-size: 4rem;
            font-weight: 900;
            text-transform: uppercase;
            margin-right: 3rem;
            color: transparent;
            -webkit-text-stroke: 1px #fff;
            transition: 0.3s;
        }
        .skill-item:hover {
            color: #fff;
            -webkit-text-stroke: 0px;
        }
        @keyframes marquee {
            0% { transform: translateX(0); }
            100% { transform: translateX(-50%); }
        }
        .projects {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 6rem;
        }
        .project-card {
            background: #111;
            padding: 3rem;
            transition: 0.5s;
            border: 1px solid transparent;
        }
        .project-card:hover {
            background: #000;
            border-color: #333;
            transform: scale(1.02);
        }
        .project-card h3 {
            font-size: 2rem;
            font-weight: 900;
            margin-bottom: 1rem;
            text-transform: uppercase;
        }
        .links {
            display: flex;
            gap: 2rem;
        }
        .links a {
            flex: 1;
            text-align: center;
            font-size: 1.5rem;
            font-weight: 900;
            text-transform: uppercase;
            color: #000;
            background: #fff;
            text-decoration: none;
            padding: 2rem;
            transition: 0.4s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .links a:hover {
            background: var(--primary);
            color: #fff;
            border-radius: 50px;
        }
    </style>
</head>
<body>
    <div class="cursor-glow"></div>
    <div class="container">
        <h1 class="reveal">${name.split(' ')[0]} <span>${name.split(' ').slice(1).join(' ')}</span></h1>
        <p class="bio reveal">${bio}</p>
        
        <h2>Toolkit</h2>
        <div class="skills-marquee reveal" style="animation-delay: 0.4s;">
            <div class="skills-track">
                \${skills.split(',').map((s) => '<span class="skill-item">\${s.trim()}</span>').join('')}
                \${skills.split(',').map((s) => '<span class="skill-item">\${s.trim()}</span>').join('')}
            </div>
        </div>
        
        <h2>Featured Work</h2>
        <div class="projects reveal" style="animation-delay: 0.6s;">
            \${projects.split(',').map((p) => '<div class="project-card"><h3>\${p.trim()}</h3><p style="color: #888; font-weight: 200;">Minimalist architecture providing maximum impact.</p></div>').join('')}
        </div>
        
        <div class="links reveal" style="animation-delay: 0.8s;">
            <a href="${githubUrl}" target="_blank">GitHub</a>
            <a href="${linkedinUrl}" target="_blank">LinkedIn</a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'notion_style',
    title: 'Notion Pro',
    type: 'Document Layout',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1555448248-2571daf6344b?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name}</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --bg: #191919;
            --surface: #202020;
            --text: #e0e0e0;
            --text-muted: #9e9e9e;
            --border: #333333;
        }
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background-color: var(--bg);
            color: var(--text);
            line-height: 1.6;
            margin: 0; padding: 0;
        }
        .page-cover {
            height: 30vh;
            background: linear-gradient(45deg, var(--primary), #3a3a3a);
            position: relative;
        }
        .container {
            max-width: 900px;
            margin: -50px auto 0;
            padding: 0 2rem 5rem;
            position: relative;
        }
        .icon {
            font-size: 5rem;
            background: var(--bg);
            padding: 10px;
            border-radius: 10px;
            display: inline-block;
            margin-bottom: 1rem;
        }
        h1 {
            font-size: 3rem;
            font-weight: 700;
            margin: 0 0 0.5rem;
            letter-spacing: -1px;
        }
        .divider {
            height: 1px;
            background: var(--border);
            margin: 2rem 0;
        }
        .block {
            margin-bottom: 1.5rem;
            display: flex;
            align-items: flex-start;
        }
        .block-icon {
            width: 24px;
            margin-right: 12px;
            margin-top: 4px;
            color: var(--text-muted);
        }
        .h2-block {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 3rem 0 1rem;
            display: flex;
            align-items: center;
        }
        .callout {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 16px;
            display: flex;
            gap: 16px;
            margin-bottom: 24px;
            transition: 0.2s;
        }
        .callout:hover { background: #252525; }
        
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 16px;
            margin-bottom: 24px;
        }
        .card {
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 16px;
            transition: 0.2s;
            cursor: pointer;
        }
        .card:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            border-color: #555;
        }
        .tag {
            display: inline-block;
            background: rgba(255,255,255,0.1);
            color: var(--text);
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 0.85rem;
            margin: 0 8px 8px 0;
        }
        .link-block {
            display: flex;
            align-items: center;
            padding: 8px 12px;
            border-radius: 6px;
            text-decoration: none;
            color: var(--text);
            transition: 0.2s;
        }
        .link-block:hover { background: rgba(255,255,255,0.05); }
        .link-block span { text-decoration: underline; text-decoration-color: var(--border); }
    </style>
</head>
<body>
    <div class="page-cover"></div>
    <div class="container">
        <div class="icon">🚀</div>
        <h1>${name}</h1>
        <p style="color: var(--text-muted); font-size: 1.1rem; max-width: 700px;">${bio}</p>
        
        <div class="divider"></div>
        
        <div class="h2-block">
            <span style="margin-right:10px;">📋</span> Skills & Expertise
        </div>
        <div>
            \${skills.split(',').map((s) => '<span class="tag">\${s.trim()}</span>').join('')}
        </div>
        
        <div class="h2-block">
            <span style="margin-right:10px;">📂</span> Projects Database
        </div>
        <div class="gallery">
            \${projects.split(',').map((p) => '<div class="card"><div style="font-size: 24px; margin-bottom: 8px;">📄</div><h3 style="margin:0 0 8px; font-size:1.1rem;">\${p.trim()}</h3><p style="margin:0; font-size:0.9rem; color:var(--text-muted);">Completed Project</p></div>').join('')}
        </div>
        
        <div class="h2-block">
            <span style="margin-right:10px;">🔗</span> Connect
        </div>
        <div style="display:flex; flex-direction:column; gap:8px;">
            <a href="${githubUrl}" class="link-block" target="_blank">
                <span style="margin-right: 12px; font-size:1.2rem;">👨‍💻</span>
                <span>GitHub Profile</span>
            </a>
            <a href="${linkedinUrl}" class="link-block" target="_blank">
                <span style="margin-right: 12px; font-size:1.2rem;">💼</span>
                <span>LinkedIn Network</span>
            </a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'bento_grid_v2',
    title: 'Bento Grid V2',
    type: 'Apple Style',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1618761714954-0b8cd0026356?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} | Bento</title>
    <link href="https://fonts.googleapis.com/css2?family=SF+Pro+Display:wght@400;600;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --bg: #f5f5f7;
            --card-bg: rgba(255, 255, 255, 0.7);
            --text: #1d1d1f;
            --text-secondary: #86868b;
        }
        @media (prefers-color-scheme: dark) {
            :root {
                --bg: #000000;
                --card-bg: rgba(28, 28, 30, 0.7);
                --text: #f5f5f7;
            }
        }
        * { box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: var(--bg);
            color: var(--text);
            margin: 0; padding: 4rem 2rem;
            min-height: 100vh;
        }
        .container {
            max-width: 1100px;
            margin: 0 auto;
        }
        .bento-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-auto-rows: minmax(180px, auto);
            gap: 24px;
        }
        .box {
            background: var(--card-bg);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-radius: 32px;
            padding: 2.5rem;
            box-shadow: 0 8px 32px rgba(0,0,0,0.04);
            border: 1px solid rgba(255,255,255,0.2);
            transition: 0.4s cubic-bezier(0.2, 0.8, 0.2, 1);
            overflow: hidden;
            position: relative;
            display: flex;
            flex-direction: column;
        }
        .box:hover {
            transform: scale(1.02);
            box-shadow: 0 20px 40px rgba(0,0,0,0.08);
        }
        
        .hero-box { grid-column: span 4; grid-row: span 2; background: linear-gradient(135deg, var(--card-bg), rgba(255,255,255,0.2)); }
        .hero-box h1 { font-size: 4rem; margin: 0 0 1rem; font-weight: 800; letter-spacing: -1px; }
        .hero-box p { font-size: 1.5rem; color: var(--text-secondary); max-width: 800px; margin: 0; line-height: 1.4; }
        
        .skill-box { grid-column: span 2; grid-row: span 2; }
        .skill-box h3 { font-size: 1.8rem; margin: 0 0 1.5rem; font-weight: 600; }
        .tags { display: flex; flex-wrap: wrap; gap: 10px; }
        .tag { 
            background: rgba(134, 134, 139, 0.1); 
            color: var(--text);
            padding: 12px 20px; 
            border-radius: 12px; 
            font-size: 1rem; 
            font-weight: 600; 
            transition: 0.2s;
        }
        .tag:hover { background: var(--primary); color: #fff; }
        
        .project-box { grid-column: span 2; grid-row: span 1; background: var(--primary); color: #fff; justify-content: center; }
        .project-box h3 { font-size: 2rem; margin: 0; font-weight: 700; }
        .project-box p { opacity: 0.8; font-size: 1.1rem; margin-top: 10px; }
        
        .link-box { grid-column: span 1; grid-row: span 1; justify-content: center; align-items: center; text-decoration: none; color: var(--text); }
        .link-box h2 { font-size: 1.5rem; margin: 0; font-weight: 600; }
        .link-box::after {
            content: '↗';
            position: absolute;
            top: 20px; right: 20px;
            font-size: 1.5rem;
            color: var(--text-secondary);
            transition: 0.3s;
        }
        .link-box:hover::after { transform: translate(5px, -5px); color: var(--text); }
        
        @media (max-width: 900px) {
            .bento-grid { grid-template-columns: 1fr; }
            .hero-box, .skill-box, .project-box, .link-box { grid-column: span 1; }
            .hero-box h1 { font-size: 2.5rem; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="bento-grid">
            <div class="box hero-box">
                <h1>Hello. I'm ${name}.</h1>
                <p>${bio}</p>
            </div>
            
            <div class="box skill-box">
                <h3>Technical Stack</h3>
                <div class="tags">
                    \${skills.split(',').map((s) => '<div class="tag">\${s.trim()}</div>').join('')}
                </div>
            </div>
            
            <div class="box project-box">
                <h3>Featured Work</h3>
                <p>\${projects.split(',').take(2).join(' • ')}</p>
            </div>
            
            <a href="${githubUrl}" class="box link-box gh" target="_blank">
                <h2>GitHub</h2>
            </a>
            
            <a href="${linkedinUrl}" class="box link-box in" target="_blank">
                <h2>LinkedIn</h2>
            </a>
        </div>
    </div>
</body>
</html>
'''
  ),
  PortfolioTemplate(
    id: 'split_screen',
    title: 'Split Screen',
    type: 'Dual Layout',
    category: 'Minimal',
    imageUrl: 'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?auto=format&fit=crop&w=400&q=80',
    generateHtml: ({required name, required bio, required skills, required projects, required githubUrl, required linkedinUrl, required primaryColor}) => '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name}</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;600;900&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: \${primaryColor};
            --dark: #111;
            --light: #fff;
        }
        body, html {
            margin: 0; padding: 0;
            font-family: 'Montserrat', sans-serif;
            height: 100%;
            overflow: hidden;
        }
        @media (max-width: 800px) {
            body, html { overflow: auto; }
        }
        .wrapper {
            display: flex;
            height: 100vh;
        }
        .left-panel {
            flex: 1;
            background: linear-gradient(45deg, var(--dark), #2a2a2a);
            color: var(--light);
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 5vw;
            position: relative;
            overflow: hidden;
        }
        .left-panel::before {
            content: '';
            position: absolute;
            width: 150%; height: 150%;
            background: radial-gradient(circle, rgba(255,255,255,0.05) 0%, transparent 60%);
            top: -25%; left: -25%;
            animation: rotate 20s linear infinite;
        }
        @keyframes rotate { 100% { transform: rotate(360deg); } }
        
        .right-panel {
            flex: 1;
            background: var(--light);
            color: var(--dark);
            overflow-y: auto;
            padding: 5vw;
            scroll-behavior: smooth;
        }
        h1 {
            font-size: 4vw;
            font-weight: 900;
            margin: 0 0 1rem;
            position: relative;
            z-index: 10;
        }
        .bio {
            font-size: 1.2vw;
            font-weight: 300;
            opacity: 0.8;
            max-width: 80%;
            line-height: 1.8;
            position: relative;
            z-index: 10;
        }
        .socials {
            margin-top: 3rem;
            display: flex;
            gap: 20px;
            position: relative;
            z-index: 10;
        }
        .socials a {
            color: var(--light);
            text-decoration: none;
            border: 1px solid rgba(255,255,255,0.3);
            padding: 10px 20px;
            border-radius: 50px;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: 0.3s;
        }
        .socials a:hover {
            background: var(--light);
            color: var(--dark);
        }
        
        .section {
            margin-bottom: 4rem;
            animation: slideUp 1s ease forwards;
            opacity: 0;
            transform: translateY(30px);
        }
        .section:nth-child(1) { animation-delay: 0.2s; }
        .section:nth-child(2) { animation-delay: 0.4s; }
        @keyframes slideUp { to { opacity: 1; transform: translateY(0); } }
        
        h2 {
            font-size: 2.5rem;
            font-weight: 900;
            margin: 0 0 2rem;
            color: var(--primary);
            text-transform: uppercase;
            letter-spacing: -1px;
        }
        .tags {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        .tag {
            background: #f0f0f0;
            padding: 15px 25px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1rem;
            transition: 0.2s;
        }
        .tag:hover {
            background: var(--primary);
            color: #fff;
            transform: scale(1.05);
        }
        .project-item {
            padding: 2rem;
            background: #f9f9f9;
            border-radius: 16px;
            margin-bottom: 1.5rem;
            border-left: 5px solid var(--primary);
            transition: 0.3s;
        }
        .project-item:hover {
            transform: translateX(10px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.05);
        }
        .project-item h3 {
            font-size: 1.5rem;
            margin: 0 0 10px;
            font-weight: 900;
        }
        .project-item p { margin: 0; color: #666; font-weight: 300; }
        
        @media (max-width: 800px) {
            .wrapper { flex-direction: column; height: auto; }
            .left-panel, .right-panel { padding: 10vw; }
            .left-panel { min-height: 60vh; }
            h1 { font-size: 2.5rem; }
            .bio { font-size: 1rem; max-width: 100%; }
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="left-panel">
            <h1>${name}</h1>
            <p class="bio">${bio}</p>
            
            <div class="socials">
                <a href="${githubUrl}" target="_blank">GitHub</a>
                <a href="${linkedinUrl}" target="_blank">LinkedIn</a>
            </div>
        </div>
        
        <div class="right-panel">
            <div class="section">
                <h2>Skillset</h2>
                <div class="tags">
                    \${skills.split(',').map((s) => '<div class="tag">\${s.trim()}</div>').join('')}
                </div>
            </div>
            
            <div class="section">
                <h2>Projects</h2>
                <div>
                    \${projects.split(',').map((p) => '<div class="project-item"><h3>\${p.trim()}</h3><p>Delivered robust software solutions.</p></div>').join('')}
                </div>
            </div>
        </div>
    </div>
</body>
</html>
'''
  ),
];
"""

    kept_lines.append(new_templates)
    
    with open('lib/core/templates/html_templates.dart', 'w', encoding='utf-8') as f:
        f.writelines(kept_lines)

if __name__ == '__main__':
    update_file()
